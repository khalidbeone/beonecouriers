import 'package:beonecouriers/controllers/deliverActions_controller.dart';
import 'package:beonecouriers/controllers/reasons_controller.dart';
import 'package:beonecouriers/runableShipments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveredPage extends StatefulWidget {
  
  final int shipId;
  final String awb;
  const DeliveredPage({
    super.key,
    required this.shipId,
    required this.awb
  });

  @override
  State<DeliveredPage> createState() => _DeliveredPageState();
}

class _DeliveredPageState extends State<DeliveredPage> {

  ReasonsController reasonsController = Get.put(ReasonsController());
  DeliveryActionsController deliveryActionsController = Get.put(DeliveryActionsController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 90, 31, 127),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.awb , style: const TextStyle(fontWeight: FontWeight.bold , color : Colors.white)),
            const Text('Are you sure this shipment  delivered ? ' , style:  TextStyle(color:Colors.white),),
            const Text('Confirm With Customer OTP' , style:  TextStyle(color:Colors.white),),
            const SizedBox(height:10),
             Padding(
              padding: const EdgeInsets.all(15),
              child:  TextField(
                      controller: deliveryActionsController.otpEditingController,
                      decoration:  const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'OTP',
                        prefixIcon: Icon(Icons.key),
                      ),
                      keyboardType: TextInputType.number,
                    ),
            ),
            const SizedBox(height:10),
            ElevatedButton(
              onPressed: ( () => deliveryActionsController.deliveredShipment(widget.shipId) ), // change here the reason after listing it 
               child: 
                const Text('Confirm  Delivered !' , style: TextStyle(color:Color.fromARGB(255, 14, 115, 75) , fontWeight: FontWeight.bold),)
               ),
            const SizedBox(height:50),
            GestureDetector(
              onTap: () => Get.to(const RunableShipments()),
              child: const Text('Go Back' , style:  TextStyle(color:Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}