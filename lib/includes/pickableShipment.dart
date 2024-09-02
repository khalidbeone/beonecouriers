import 'package:flutter/material.dart';

class PickableShipment extends StatefulWidget {
  final String awbNo;
  final String address;
  final String referenceNo;
  final String recName;
  final String codAmount;
  final String senderName;
  final String recPhone;

  const PickableShipment(
      {super.key,
      required this.awbNo,
      required this.address,
      required this.referenceNo,
      required this.recName,
      required this.codAmount,
      required this.senderName,
      required this.recPhone
      });

  @override
  State<PickableShipment> createState() => _PickableShipmentState();
}

class _PickableShipmentState extends State<PickableShipment> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        print("Clicked AWB");
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
                      height: 15,
                      child: Text(widget.address),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                   Expanded(child: Row(children: [
                     Container(
                      margin: const EdgeInsets.all(5),
                      child: const Icon(Icons.phone,
                          color: Color.fromRGBO(155, 155, 155, 1), size: 14),
                    ),
                    SizedBox(
                      height: 15,
                      child: Text(widget.recPhone),
                    ),
                   ],)),
                   Expanded(child: Row(children: [
                     Container(
                      margin: const EdgeInsets.all(5),
                      child: const Icon(Icons.payment,
                          color: Color.fromRGBO(155, 155, 155, 1), size: 14),
                    ),
                    SizedBox(
                      height: 15,
                      child: Text('COD : ${widget.codAmount}'),
                    ),
                   ],))
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
