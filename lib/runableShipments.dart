import 'package:beonecouriers/includes/barCard.dart';
import 'package:beonecouriers/includes/menuTabs.dart';
import 'package:beonecouriers/includes/pageLabel.dart';
import 'package:flutter/material.dart';

class RunableShipments extends StatefulWidget {
  const RunableShipments({super.key});

  @override
  State<RunableShipments> createState() => _RunableShipmentsState();
}

class _RunableShipmentsState extends State<RunableShipments> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
           const BarCard(),
           Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child : const PageLabel(subject: 'My Runable Shipments'),
                ),
              ],
            ),
          ),
          const MenuTabs(selectedIndex: 0),
        ],
      ),
    );
  }
}