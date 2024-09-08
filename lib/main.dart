import 'dart:async';

import 'package:beonecouriers/controllers/authcheckCotnroller.dart';
import 'package:beonecouriers/controllers/refreshToken_controller.dart';
import 'package:beonecouriers/homepage.dart';
import 'package:beonecouriers/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RefreshController refreshController = Get.put(RefreshController());
  AuthCheckController authCheckController = Get.put(AuthCheckController());

  Timer? _timer;

  @override
  void initState() {
    try {
      super.initState();
      // print ('Tt [[ ${authCheckController.checkAuthing.toString()} ]]');

      // Immediately refresh the token when the app starts
      refreshController.refreshToken();

      // Set up the timer to refresh the token every hour
      _timer = Timer.periodic(const Duration(minutes: 40), (timer) {
        var token = refreshController.refreshToken();
        print(token);
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BeOne Express Courier',
      theme: ThemeData(
        fontFamily: 'Lato',
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
              color: Color.fromRGBO(145, 145, 145, 1),
              fontFamily: 'Lato',
              fontSize: 11,
              fontWeight: FontWeight.w700),
          iconColor: Color.fromRGBO(145, 145, 145, 1),
          prefixIconColor: Color.fromRGBO(145, 145, 145, 1),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: authCheckController.checkAuthing.toString().indexOf('Closure') > 0
          ? const Homepage()
          : const LoginPage(),
    );
  }
}
