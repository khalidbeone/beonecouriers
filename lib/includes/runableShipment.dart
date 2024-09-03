import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shipDetails.dart';

class RunableShipment extends StatefulWidget {
  final String awbNo;
  final String address;
  final String referenceNo;
  final String recName;
  final String codAmount;
  final String senderName;
  final String recPhone;
  final String city; 
  final String lang;
  final String lat;

  const RunableShipment(
      {super.key,
      required this.awbNo,
      required this.address,
      required this.referenceNo,
      required this.recName,
      required this.codAmount,
      required this.senderName,
      required this.recPhone,
      required this.city,
      required this.lang,
      required this.lat
      });

  @override
  State<RunableShipment> createState() => _RunableShipmentState();
}

class _RunableShipmentState extends State<RunableShipment> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.to(ShipDetailsPage(
          awbNo: widget.awbNo, 
          referenceNo: widget.referenceNo, 
          sender: widget.senderName, 
          receiver: widget.recName, 
          phone: widget.recPhone, 
          city: widget.city, 
          address: widget.address, 
          long: widget.lang, 
          lat: widget.lat, 
          cod: widget.codAmount
          ));
      }),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(widget.awbNo,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(
                ' REF#: ${widget.referenceNo}',
                style: const TextStyle(
                    color: Color.fromRGBO(92, 92, 92, 1),
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: const Icon(
                            Icons.person_4,
                            color: Color.fromRGBO(155, 155, 155, 1),
                            size: 14,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                          child: Text(widget.senderName),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: const Icon(Icons.person_4,
                              color: Color.fromRGBO(155, 155, 155, 1),
                              size: 14),
                        ),
                        SizedBox(
                          height: 15,
                          child: Text(widget.recName),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              Padding(
                padding : const EdgeInsets.all(8),
                child: Row(
                  children: [
                      Container(
                      margin: const EdgeInsets.all(5),
                      child: const Icon(Icons.location_pin,
                          color: Color.fromRGBO(155, 155, 155, 1), size: 14),
                    ),
                    SizedBox(
                      width: 300,
                      height: 15,
                      child: Text(
                        widget.address,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 11),
                        ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //      Expanded(child: Row(children: [
              //        Container(
              //         margin: const EdgeInsets.all(5),
              //         child: const Icon(Icons.phone,
              //             color: Color.fromRGBO(155, 155, 155, 1), size: 14),
              //       ),
              //       SizedBox(
              //         height: 15,
              //         child: Text(widget.recPhone),
              //       ),
              //      ],)),
              //      Expanded(child: Row(children: [
              //        Container(
              //         margin: const EdgeInsets.all(5),
              //         child: const Icon(Icons.payment,
              //             color: Color.fromRGBO(155, 155, 155, 1), size: 14),
              //       ),
              //       SizedBox(
              //         height: 15,
              //         child: Text('COD : ${widget.codAmount}'),
              //       ),
              //      ],))
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
