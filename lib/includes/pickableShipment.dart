import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pickDetailsPage.dart';

class PickableShipment extends StatefulWidget {
  final String awbNo;
  final String address;
  final String referenceNo;
  final String senderName;
  final String senderPhone;
  final String status;

  const PickableShipment(
      {super.key,
      required this.awbNo,
      required this.address,
      required this.referenceNo,
      required this.senderName,
      required this.senderPhone,
      required this.status
      });

  @override
  State<PickableShipment> createState() => _PickableShipmentState();
}

class _PickableShipmentState extends State<PickableShipment> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.to(PickDetailsPage(
          awbNo : widget.awbNo,
          address : widget.address,
          referenceNo : widget.referenceNo,
          senderName: widget.senderName,
          senderPhone: widget.senderPhone
         ));
      }),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(widget.awbNo,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
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
                          width: 100,
                          height: 15,
                          child: Text(
                            widget.senderName,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 11),
                            ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: const Icon(Icons.phone,
                              color: Color.fromRGBO(155, 155, 155, 1),
                              size: 14),
                        ),
                       SizedBox(
                          width: 100,
                          height: 15,
                          child: Text(
                            widget.senderPhone,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 11),
                            ),
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
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      widget.address ,
                      style: const TextStyle(fontSize: 11),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
