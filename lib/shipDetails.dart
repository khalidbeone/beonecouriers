import 'package:beonecouriers/includes/barCard.dart';
import 'package:beonecouriers/includes/menuTabs.dart';
import 'package:beonecouriers/includes/pageLabel.dart';
import 'package:beonecouriers/noDeliveredPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShipDetailsPage extends StatefulWidget {
  final int shipId;
  final String awbNo;
  final String referenceNo;
  final String sender;
  final String receiver;
  final String phone;
  final String city;
  final String address;
  final String cod;

  const ShipDetailsPage(
      {super.key,
      required this.shipId,
      required this.awbNo,
      required this.referenceNo,
      required this.sender,
      required this.receiver,
      required this.phone,
      required this.city,
      required this.address,
      required this.cod});

  @override
  State<ShipDetailsPage> createState() => __ShipDetailsPagStateState();
}

class __ShipDetailsPagStateState extends State<ShipDetailsPage> {
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
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 0.2,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.monetization_on,
                                color: Colors.purple,
                                size: 25,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${widget.cod} SAR',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 0.2,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.location_city,
                                color: Colors.purple,
                                size: 25,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${widget.city} ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                              widget.sender,
                              style: const TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.person,
                                color: Colors.purple, size: 20),
                            const Text(
                              'To Customer : ',
                              style: TextStyle(color: Colors.purple),
                            ),
                            Text(
                              widget.receiver,
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
                            Text(
                              widget.address,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 13),
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
                        print('action want to be taken');
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
                              'Delivered',
                              style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: (() {
                        Get.to(NotDeliveredPage(shipId: widget.shipId,));
                      }),
                      style:  ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 184, 64, 17),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) ,
                        ),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Icon(
                              Icons.wrong_location,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Not Delivered',
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
