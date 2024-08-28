import 'package:beonecouriers/includes/copyRights.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final   TextEditingController _email = TextEditingController() ;
  final   TextEditingController _password = TextEditingController() ;

   

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
                        onPressed: ( (){ }),
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
