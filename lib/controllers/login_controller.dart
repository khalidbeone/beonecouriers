import 'dart:convert';
import 'package:beonecouriers/homepage.dart';
import 'package:flutter/material.dart';
import '../Core/apiCore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http ;
import 'package:shared_preferences/shared_preferences.dart';
class LoginController extends GetxController{

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginAuth() async {
    var headers = {"Content-Type": "application/json" , "Accept" : "application/json"};
    if(emailController != '' && passwordController != ''){
      try{

            var url = Uri.parse(demoBaseUrl + methods[0]);

            Map body = {
              "email": emailController.text.trim(),
              "password" : passwordController.text
            };

            http.Response response = await http.post(url , body : jsonEncode(body) , headers : headers);

            if (response.statusCode == 200 ){
              final data = jsonDecode(response.body);
              if (data['status'] == 200 ){
                var token = data['data']['access_token'];
                final SharedPreferences? prefs = await _prefs;
                await prefs?.setString('token', token);

                emailController.clear();
                passwordController.clear();
                print(prefs?.get('token'));
                //redirect to homepage 
                Get.off(const Homepage());
              }
            }else{
              throw jsonDecode(response.body)["message"] ??  "Contact IT Support Issue Happened";
            }

          }catch(e){
            Get.back();
            showDialog(
              context: Get.context!, 
                builder: (context){
                  return  SimpleDialog(
                    backgroundColor: Colors.red,
                    contentPadding: const EdgeInsets.all(12),
                    children: [  const Text('Error', style: TextStyle(color:Colors.white),) , const SizedBox(height:10) ,Text(e.toString() ,style: const TextStyle(color:Colors.white))],
                  );
                }
              );
          }
        
    }else{
            Get.back();
            showDialog(
              context: Get.context!, 
                builder: (context){
                  return  const SimpleDialog(
                    backgroundColor: Colors.red,
                    contentPadding:  EdgeInsets.all(12),
                    children: [   Text('Error', style: TextStyle(color:Colors.white),) ,  SizedBox(height:10) ,Text('Invalid Inromation' , style:   TextStyle(color:Colors.white))],
                  );
                }
              );
    }
   }

}