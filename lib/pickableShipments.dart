import 'package:beonecouriers/controllers/picklist_controller.dart';
import 'package:beonecouriers/includes/barCard.dart';
import 'package:beonecouriers/includes/menuTabs.dart';
import 'package:beonecouriers/includes/pageLabel.dart';
import 'package:beonecouriers/includes/pickableShipment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickableShipments extends StatefulWidget {
  const PickableShipments({super.key});

  @override
  State<PickableShipments> createState() => _PickableShipmentstate();
}

class _PickableShipmentstate extends State<PickableShipments> {

  PicklistController picklistController = Get.put(PicklistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const BarCard(),
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const PageLabel(subject: 'My PickList Shipments'),
                ),
                // create search input here to get the AWB fast
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(15),
                   child: FutureBuilder(
                    future: picklistController.getPicklist(),
                    builder: (context,snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text('No information to list here '),
                          );
                        }
                    final data = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: data['data'].length,
                        itemBuilder: (context , index){
                          return PickableShipment(
                            awbNo: data['data'][index]['shipments']['awb_no'],
                            referenceNo: data['data'][index]['shipments']['reference_number'] ,
                            recName:  data['data'][index]['receiver']['name'], 
                            address: data['data'][index]['receiver']['address'] ,
                            senderName: data['data'][index]['shipments']['sender'],
                            recPhone: data['data'][index]['receiver']['phone'] ,
                            codAmount: data['data'][index]['shipments']['cod_fees'],
                            );
                      });
                    }),
                 ),
               )
              ],
            ),
          ),
          const MenuTabs(selectedIndex: 0),
        ],
      ),
    ); 
  }
}