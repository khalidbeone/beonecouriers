import 'package:flutter/material.dart';

class RunableShipment extends StatefulWidget {
  final String awbNo; 
  final String address;
  final String referenceNo;
  final String recName;

  const RunableShipment({
    super.key,
    required this.awbNo,
    required this.address,
    required this.referenceNo,
    required this.recName
    });

  @override
  State<RunableShipment> createState() => _RunableShipmentState();
}

class _RunableShipmentState extends State<RunableShipment> {
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
              Text( widget.awbNo,
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
                        const Icon(
                          Icons.verified_user,
                          color: Color.fromRGBO(155, 155, 155, 1),
                          size: 12,
                        ),
                        SizedBox(
                          height: 15,
                          child: Text(widget.recName),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        const Icon(Icons.location_pin,
                            color: Color.fromRGBO(155, 155, 155, 1), size: 12),
                        SizedBox(
                          height: 15,
                          child: Text(widget.address),
                        ),
                      ],
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
