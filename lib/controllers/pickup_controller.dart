import 'dart:convert';
import 'package:beonecouriers/pickableShipments.dart';
import 'package:flutter/material.dart';
import '../Core/apiCore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PickupActionController extends GetxController {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<void> pickedUp(shipId ) async {
    
    final  SharedPreferences? prefs = await _prefs;

    var token = prefs?.getString('token').toString();
    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',

    };
    if (shipId != '') {
      try {
        var url = Uri.parse(demoBaseUrl + methods[9]);

        Map body = {
          "awb_no": shipId
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
                  const Text('Pickup Compeleted / Scanned ',
                      style: TextStyle(color: Colors.white)),
                  ElevatedButton(onPressed: ( () => Get.to( const PickableShipments()) ), child: const Text('Go Back Picklist <-')),
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
