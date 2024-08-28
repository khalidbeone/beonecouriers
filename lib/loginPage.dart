import 'package:beonecouriers/homepage.dart';
import 'package:beonecouriers/includes/copyRights.dart';
import 'package:flutter/material.dart';
import 'Box/sessionBox.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final   TextEditingController _email = TextEditingController() ;
  final   TextEditingController _password = TextEditingController() ;

   List<Map<String,dynamic>> courierInfo  = [];
   List<Map<String,dynamic>> authInfo  = [];
    
    Future<Map<String, dynamic>>  authingFunction (email , password) async{
        try{
          final res = await http.post(
            Uri.parse(demoBaseUrl + methods[0]),
            headers: {"Content-Type": "application/json" , "Accept" : "application/json"} ,
            body:jsonEncode({ "email" : email , "password" : password})
          );
          final data = jsonDecode(res.body);
          if( data['status'] == 200 ){
            final courierData  = await http.get(Uri.parse(demoBaseUrl + methods[3]),
              headers: {"Content-Type": "application/json" , "Accept" : "application/json" , 'Authorization': data['data']['access_token'] },
            );
            final courier  = jsonDecode(courierData.body);
            if( courier['status'] == 200 ){
              setState(() {
                authInfo = data ;
                courierInfo = courier ;
              });
            }
          }
          return  data;
        }catch(e){
          throw  e.toString();
        }
      }


  void loginCourier(){
    if( _email.text.toString() != '' || _password.text.toString() != ''){
        // authingFunction(_email.text , _password.text);
             print(authInfo['data']['access_token']);
              print(authInfo['data']['token_type']);
              print(courierInfo['data']['id']);
              print(courierInfo['data']['name']);


        if(box.read('email') != ''  && box.read('token') != '' ){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Homepage()));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content:  Text('Invalid Information | Contact Support ' , style: TextStyle(fontWeight: FontWeight.bold),) , backgroundColor: Colors.red,)
              );    
          }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content:  Text('Invalid Information | Contact Support ' , style: TextStyle(fontWeight: FontWeight.bold),) , backgroundColor: Colors.red,)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/beone_logo_white.png', height: 100),
            const SizedBox(height: 20),
            const Text(
              'Welcome Back Partner',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                   TextField(
                    controller: _email,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 20),
                   TextField(
                    controller: _password,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.key),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: loginCourier,
                        style:  ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(255, 159, 67,1.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) ,
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height:80),
                  const CopyRightsShared(),
                ],
              ),
            ),
          ],
        ),
      ),
    )  ;
  }
}
