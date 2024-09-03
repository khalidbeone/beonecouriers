import 'package:beonecouriers/includes/barCard.dart';
import 'package:flutter/material.dart';

class ShipDetailsPage extends StatefulWidget {
  final String awbNo;
  final String referenceNo;
  final String sender;
  final String receiver;
  final String phone;
  final String city;
  final String address;
  final String long;
  final String lat;
  final String cod;

  const ShipDetailsPage({
    super.key,
    required  this.awbNo,
    required  this.referenceNo,
    required  this.sender,
    required  this.receiver,
    required  this.phone,
    required  this.city,
    required  this.address,
    required  this.long,
    required  this.lat,
    required  this.cod
    });

  @override
  State<ShipDetailsPage> createState() => __ShipDetailsPagStateState();
}

class __ShipDetailsPagStateState extends State<ShipDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const BarCard(),
        ],
      ),
    );
  }
}