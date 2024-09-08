import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCheckController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future isAuthed() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs?.getString('token').toString();
    return  token;
  }
}
