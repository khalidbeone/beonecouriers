import 'package:beonecouriers/includes/barCard.dart';
import 'package:beonecouriers/includes/menuTabs.dart';
import 'package:beonecouriers/includes/pageLabel.dart';
import 'package:flutter/material.dart';

class PickableShipments extends StatefulWidget {
  const PickableShipments({super.key});

  @override
  State<PickableShipments> createState() => _PickableShipmentstate();
}

class _PickableShipmentstate extends State<PickableShipments> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
           const BarCard(),
           Column(
             children: [
               Container(
                 alignment: Alignment.centerLeft,
                 child : const PageLabel(subject: 'My Pickable Shipments'),
               ),
               Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index){
                      return Card(
                        child: Column(

                        ),
                      );
                    }
                  ),
               ),
             ],
           ),
          const MenuTabs(selectedIndex: 0),
        ],
      ),
    );
  }
}