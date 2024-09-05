import 'package:beonecouriers/controllers/deliverActions_controller.dart';
import 'package:beonecouriers/controllers/reasons_controller.dart';
import 'package:beonecouriers/runableShipments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotDeliveredPage extends StatefulWidget {
  final int shipId;
  final String awb;
  const NotDeliveredPage({
    super.key,
    required this.shipId,
    required this.awb
  });

  @override
  State<NotDeliveredPage> createState() => _NotDeliveredPageState();
}

class _NotDeliveredPageState extends State<NotDeliveredPage> {

  ReasonsController reasonsController = Get.put(ReasonsController());
  DeliveryActionsController deliveryActionsController = Get.put(DeliveryActionsController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 45, 37),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.awb , style: const TextStyle(fontWeight: FontWeight.bold , color : Colors.white)),
            const Text('Are you sure this shipment not delivered ? ' , style:  TextStyle(color:Colors.white),),
            const Text('Choose the reason please  ' , style:  TextStyle(color:Colors.white),),
            const SizedBox(height:10),
            ElevatedButton(
              onPressed: ( () => deliveryActionsController.notDelivered(widget.shipId , 32) ), // change here the reason after listing it 
               child: 
                const Text('Confirm not Delivered !' , style: TextStyle(color:Colors.red , fontWeight: FontWeight.bold),)
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