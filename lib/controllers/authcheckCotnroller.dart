import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCheckController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String authed = '';

  String isAuthed(){
    return authed;
  }

  Future checkAuthing() async {
    final SharedPreferences prefs = await _prefs;
    // var token = prefs?.getString('token').toString();

    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // Example with a String value
    String? stringValue = prefs.getString('token');
    if (stringValue == null) {
      // The value is null (key does not exist or value was null)
      return authed = '';
    }

  }
}
