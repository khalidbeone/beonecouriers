import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shipDetails.dart';
import 'package:url_launcher/url_launcher.dart';

class RunableShipment extends StatefulWidget {
  final int shipId;
  final String awbNo;
  final String address;
  final String referenceNo;
  final String recName;
  final String codAmount;
  final String senderName;
  final String recPhone;
  final String city; 

  const RunableShipment(
      {super.key,
      required this.shipId,
      required this.awbNo,
      required this.address,
      required this.referenceNo,
      required this.recName,
      required this.codAmount,
      required this.senderName,
      required this.recPhone,
      required this.city
      });

  @override
  State<RunableShipment> createState() => _RunableShipmentState();
}

class _RunableShipmentState extends State<RunableShipment> {
  
    openDialPad(String phoneNumber) async {
    Uri url = Uri(scheme: "tel", path: phoneNumber);
    if (await launchUrl(url)) {
    } else {
       print("Can't open dial pad.");
    }
}


  @override
  Widget build(BuildContext context) {
    


  final String courierMsg  = "مرحباً عميل بي وان ${widget.recName} بشحنة رقم : ${widget.awbNo}  أود أعلامكم بانه في طريقي اليكم لتوصيل الشحنه ,, من البائع ${widget.senderName} أرجو  تزويدي بالعنوان من خلال مشاركته في هذه المحادثة ";

  var whatsappUrl =
        "whatsapp://send?phone=${widget.recPhone}" "&text=${Uri.encodeComponent(courierMsg)}";

    return GestureDetector(
      onTap: (() {
        Get.to(ShipDetailsPage(
          shipId: widget.shipId, 
          awbNo: widget.awbNo, 
          referenceNo: widget.referenceNo, 
          sender: widget.senderName, 
          receiver: widget.recName, 
          phone: widget.recPhone, 
          city: widget.city, 
          address: widget.address, 
          cod: widget.codAmount
          ));
      }),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(7),
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
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(3),
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
                            margin: const EdgeInsets.all(3),
                            child: const Icon(Icons.person_4,
                                color: Color.fromRGBO(155, 155, 155, 1),
                                size: 14),
                          ),
                          SizedBox(
                          width: 100,
                          height: 15,
                          child: Text(
                            widget.recName,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 11),
                            ),
                        ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
              Padding(
                padding : const EdgeInsets.all(3),
                child: Row(
                  children: [
                      Container(
                      margin: const EdgeInsets.all(3),
                      child: const Icon(Icons.location_pin,
                          color: Color.fromRGBO(155, 155, 155, 1), size: 14),
                    ),
                    SizedBox(
                      width: 300,
                      height: 15,
                      child: Text(
                        widget.address,
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 11),
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child:  ElevatedButton(
                                onPressed: ()  async {
                                  if (await launchUrl(Uri.parse(whatsappUrl))) {
                                      } else {
                                        print("cant open whats app.");
                                      }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 8, 114, 65),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: const Icon(Icons.message , size: 12 , color: Colors.white,),
                              ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child:  ElevatedButton(
                                onPressed: (() {
                                 openDialPad(widget.recPhone.toString());
                                }),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 40, 8, 114),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: const Icon(Icons.call , size: 12 , color: Colors.white,),
                              ),
                    ),
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
