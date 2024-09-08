import 'dart:convert';
import '../Core/apiCore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RefreshController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<Map<String, dynamic>> refreshToken() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token').toString();
    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse(demoBaseUrl + methods[1]);
    try {
      // print(token);
      final res = await http.get(url, headers: headers);
      final data = jsonDecode(res.body);
      print(data);
      prefs.setString('token', data['data']['access_token']);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
