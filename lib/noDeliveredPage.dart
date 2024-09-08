import 'package:beonecouriers/controllers/deliverActions_controller.dart';
import 'package:beonecouriers/controllers/reasons_controller.dart';
import 'package:beonecouriers/runableShipments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Core/apiCore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Item {
  final String id;
  final String reason;

  Item({required this.id, required this.reason});

  @override
  String toString() {
    return reason; // This is used to display the item in the dropdown.
  }
}

class NotDeliveredPage extends StatefulWidget {
  final int shipId;
  final String awb;
  const NotDeliveredPage({super.key, required this.shipId, required this.awb});

  @override
  State<NotDeliveredPage> createState() => _NotDeliveredPageState();
}

class _NotDeliveredPageState extends State<NotDeliveredPage> {
  final Future<SharedPreferences> _prrefs = SharedPreferences.getInstance();

  ReasonsController reasonsController = Get.put(ReasonsController());
  DeliveryActionsController deliveryActionsController =
      Get.put(DeliveryActionsController());

  String? selectedValue;
  int? selectedIndex;
  String selectedReason = "1";
  List<Item> items = [];
  Item? selectedItem;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final SharedPreferences prrefs = await _prrefs;
    var token = prrefs.getString('token').toString();
    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse(demoBaseUrl + methods[6]);
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      setState(() {
        items = data
            .map((item) => Item(
                id: item['id'].toString(), reason: item['reason'].toString()))
            .toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 45, 37),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.awb,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            const Text(
              'Are you sure this shipment not delivered ? ',
              style: TextStyle(color: Colors.white),
            ),
            const Text(
              'Choose the reason please  ',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            // start of dropdown

            Center(
              child: items.isEmpty
                  ? const CircularProgressIndicator()
                  : DropdownButton<Item>(
                      value: selectedItem,
                      hint: const Text('Select Reason'),
                      onChanged: (Item? newValue) {
                        setState(() {
                          selectedItem = newValue;
                          selectedReason = selectedItem!.id;
                        });
                      },
                      items: items.map<DropdownMenuItem<Item>>((Item value) {
                        return DropdownMenuItem<Item>(
                          value: value,
                          child: Text(value.reason),
                        );
                      }).toList(),
                    ),
            ),

            // end of drop down
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: (() {
                  deliveryActionsController.notDelivered( widget.shipId , int.parse(selectedReason));
                }), // change here the reason after listing it
                child: const Text(
                  'Confirm not Delivered !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => Get.to(const RunableShipments()),
              child: const Text(
                'Go Back',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
