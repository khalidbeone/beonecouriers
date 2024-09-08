import 'dart:convert';
import '../Core/apiCore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PicklistController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String shiplength = '0';

  Future<Map<String, dynamic>> getPicklist() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token').toString();
    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse(demoBaseUrl + methods[5]);
    try {
      // print(token);
      final res = await http.get(url, headers: headers);
      final data = jsonDecode(res.body);
      shiplength = data['data'].length.toString();
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
