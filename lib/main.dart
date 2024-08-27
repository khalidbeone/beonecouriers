import 'package:beonecouriers/homepage.dart';
import 'package:beonecouriers/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'Box/sessionBox.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeOne Express Courier',
      theme: ThemeData(
        fontFamily: 'Lato',
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Color.fromRGBO(145, 145, 145, 1) , fontFamily: 'Lato' , fontSize: 11 , fontWeight: FontWeight.w700),
          iconColor: Color.fromRGBO(145, 145, 145, 1),
          prefixIconColor: Color.fromRGBO(145, 145, 145, 1),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor:Colors.deepPurple,
        useMaterial3: true,
      ),
      home: isAuthed() ? const Homepage() : const LoginPage(),
    );
  }
}

