import 'dart:convert';
import '../Core/apiCore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
 
    Future<Map<String, dynamic>> fetchProfile() async {
      final  SharedPreferences? prefs = await _prefs;
      var token = prefs?.getString('token').toString();
        var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse(demoBaseUrl + methods[3]);
    try {
      // print(token);
      final res = await http.get(url,headers: headers);
      final data = jsonDecode(res.body);
      // print(res.body);
      // if (data['status'] == 200 ){
      //   // print (data);
      // }
      // if (res.statusCode == 200) {
      //   final SharedPreferences? prefId = await _prefs;
      //   await prefId?.setString('id', data['data']['id']);
      // }
      // print (data);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }



}
