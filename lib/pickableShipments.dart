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
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PageLabel(subject: 'My PickList Shipments'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              child: ElevatedButton(
                                onPressed: (() {}),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(255, 159, 67, 1.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: const Text('Single Pickup' , style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              child: ElevatedButton(
                                onPressed: (() {}),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(255, 159, 67, 1.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: const Text('Bulk Pickup' , style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // create search input here to get the AWB fast
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: FutureBuilder(
                        future: picklistController.getPicklist(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                              itemBuilder: (context, index) {
                                return PickableShipment(
                                  awbNo: data['data'][index]['shipment'],
                                  referenceNo: data['data'][index]['unique_id'],
                                  address: data['data'][index]
                                      ['pickup_address'],
                                  senderName: data['data'][index]
                                      ['sender_name'],
                                  senderPhone: data['data'][index]
                                      ['sender_phone'],
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
