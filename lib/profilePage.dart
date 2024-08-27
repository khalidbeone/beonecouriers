import 'package:beonecouriers/includes/barCard.dart';
import 'package:beonecouriers/includes/menuTabs.dart';
import 'package:beonecouriers/includes/pageLabel.dart';
import 'package:beonecouriers/loginPage.dart';
import 'package:flutter/material.dart';
import 'Box/sessionBox.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  void logout(){
    setState(() {
       removeAuth();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
        print('removed');
    });
      // if( removeAuth()){
      //   print('removed');
      // }
  }

  @override
  Widget build(BuildContext context) {
    return  isAuthed()?  Scaffold(
        body: Column(
          children: [
            const BarCard(),
            Expanded(child: Padding(
              padding:const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PageLabel(subject: 'My Profile '),
                  //  Text(box.read('authKey').toString()),
                  Container(
                    alignment:Alignment.center,
                    child: SizedBox(
                      width:250,
                      child: ElevatedButton(
                            onPressed: logout ,
                            style:  ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(255, 159, 67,1.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) ,
                            ),
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            )),
            const MenuTabs(selectedIndex:  2),
          ],
        ),
    ) : const LoginPage();
  }
}