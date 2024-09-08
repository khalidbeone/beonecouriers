import 'package:beonecouriers/controllers/pickup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'includes/barCard.dart';
import 'includes/menuTabs.dart';
import 'includes/pageLabel.dart';

class PickDetailsPage extends StatefulWidget {
  final String awbNo;
  final String address;
  final String referenceNo;
  final String senderName;
  final String senderPhone;

  const PickDetailsPage({
    super.key,
    required this.awbNo,
    required this.address,
    required this.referenceNo,
    required this.senderName,
    required this.senderPhone
    });

  @override
  State<PickDetailsPage> createState() => _PickDetailsPageState();
}

class _PickDetailsPageState extends State<PickDetailsPage> {


  PickupActionController pickupActionController = Get.put(PickupActionController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const BarCard(),
          PageLabel(subject: 'Shipment [ ${widget.awbNo} ] '),
          const SizedBox(
            height: 5,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.person,
                                color: Colors.purple, size: 20),
                            const Text(
                              'From Seller : ',
                              style: TextStyle(color: Colors.purple),
                            ),
                            Text(
                              widget.senderName,
                              style: const TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.phone,
                                color: Colors.purple, size: 20),
                            const Text(
                              'Phone : ',
                              style: TextStyle(color: Colors.purple),
                            ),
                            Text(
                              widget.senderPhone,
                              style: const TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.location_pin,
                                color: Colors.purple, size: 20),
                            const Text(
                              'Reference : ',
                              style: TextStyle(color: Colors.purple),
                            ),
                            Text(
                              widget.referenceNo,
                              style: const TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.location_pin,
                                color: Colors.purple, size: 20),
                            const Text(
                              'Address : ',
                              style: TextStyle(color: Colors.purple),
                            ),
                            SizedBox(
                              width: 180,
                              child: Text(
                                widget.address,
                                softWrap: true,
                                style: const TextStyle(fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: (() {
                          pickupActionController.pickedUp(widget.awbNo);  
                    }),
                      style:  ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 15, 122, 58),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) ,
                        ),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Pickedup',
                              style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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