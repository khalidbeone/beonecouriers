import 'dart:convert';
import 'package:beonecouriers/runableShipments.dart';
import 'package:flutter/material.dart';
import '../Core/apiCore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryActionsController extends GetxController {
  TextEditingController otpEditingController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<void> notDelivered(shipId , reasonId) async {
    
    final  SharedPreferences? prefs = await _prefs;
    var token = prefs?.getString('token').toString();
    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',

    };
    if (shipId != '' && reasonId != '') {
      try {
        var url = Uri.parse(demoBaseUrl + methods[7]);

        Map body = {
          "shipment_id": shipId,
          "reason_id": reasonId
        };

        http.Response response =
            await http.post(url, body: jsonEncode(body), headers: headers);

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data['errorCode'] == 0) {
          showDialog(
            context: Get.context!,
            builder: (context) {
              return  SimpleDialog(
                backgroundColor: const Color.fromARGB(255, 60, 145, 62),
                contentPadding: const EdgeInsets.all(15),
                children: [
                  const Text(
                    'Success ! ',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text('Shipment Not Delivered Updated ',
                      style: TextStyle(color: Colors.white)),
                  ElevatedButton(onPressed: ( () => Get.to( const RunableShipments()) ), child: const Text('Go Back DRS <-')),
                ],
              );
            });
          }
        } else {
          throw jsonDecode(response.body)["message"] ??
              "Contact IT Support Issue Happened";
        }
      } catch (e) {
        Get.back();
        showDialog(
            context: Get.context!,
            builder: (context) {
              return SimpleDialog(
                backgroundColor: Colors.red,
                contentPadding: const EdgeInsets.all(12),
                children: [
                  const Text(
                    'Error',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(e.toString(),
                      style: const TextStyle(color: Colors.white))
                ],
              );
            });
      }
    } else {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return const SimpleDialog(
              backgroundColor: Colors.red,
              contentPadding: EdgeInsets.all(12),
              children: [
                Text(
                  'Error',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Text('Invalid Inromation',
                    style: TextStyle(color: Colors.white))
              ],
            );
          });
    }
  }
  // end of not delivered update status 


 Future<void> deliveredShipment(shipId) async {
    
    final  SharedPreferences? prefs = await _prefs;
    var token = prefs?.getString('token').toString();
    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',

    };
    if (shipId != '' && otpEditingController.text.toString() != '') {
      try {
        var url = Uri.parse(demoBaseUrl + methods[8]);

        Map body = {
          "shipment_id": shipId,
          "otp": otpEditingController.text.toString()
        };
        // print ( otpEditingController.text.toString() );
        http.Response response =
            await http.post(url, body: jsonEncode(body), headers: headers);

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data['errorCode'] == 0) {
          showDialog(
            context: Get.context!,
            builder: (context) {
              return  SimpleDialog(
                backgroundColor: const Color.fromARGB(255, 60, 145, 62),
                contentPadding: const EdgeInsets.all(15),
                children: [
                  const Text(
                    'Success ! ',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text('Shipment Delivered Updated ',
                      style: TextStyle(color: Colors.white)),
                  ElevatedButton(onPressed: ( () => Get.to( const RunableShipments()) ), child: const Text('Go Back DRS <-')),
                ],
              );
            });
          }
        } else {
          throw jsonDecode(response.body)["message"] ??
              "Contact IT Support Issue Happened";
        }
      } catch (e) {
        Get.back();
        showDialog(
            context: Get.context!,
            builder: (context) {
              return SimpleDialog(
                backgroundColor: Colors.red,
                contentPadding: const EdgeInsets.all(12),
                children: [
                  const Text(
                    'Error',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(e.toString(),
                      style: const TextStyle(color: Colors.white))
                ],
              );
            });
      }
    } else {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return const SimpleDialog(
              backgroundColor: Colors.red,
              contentPadding: EdgeInsets.all(12),
              children: [
                Text(
                  'Error',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Text('Invalid Inromation',
                    style: TextStyle(color: Colors.white))
              ],
            );
          });
    }
  }















}
