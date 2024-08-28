// import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


const  String demoBaseUrl = 'https://demo.beone.com.sa/api/courier/v1/';
const List<String> methods = ['login','refresh','logout' , 'profile'];
        // box.write('email', email);
              // box.write('token', data['data']['access_token']);
              // box.write('id', courier['data']['id']);
              // box.write('name', courier['data']['name']);


              
// GetStorage box = GetStorage();


 Future  authingFunction (email , password) async{
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
        print(data['data']['access_token']);
        print(data['data']['token_type']);
        print(courier['data']['id']);
        print(courier['data']['name']);
        // box.write('email', email);
        // box.write('token', data['data']['access_token']);
        // box.write('id', courier['data']['id']);
        // box.write('name', courier['data']['name']);
      }
    }

  }catch(e){
    throw  e.toString();
  }
}

// bool isAuthed (){
//   if (box.read('authKey') != ''){
//     return true;
//   }
//   return false;
// }

// bool removeAuth(){
//   if (box.read('authKey') !='' ){
//     box.erase();
//     return true;
//   }
//   return false;
// }