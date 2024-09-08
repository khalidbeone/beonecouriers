import 'package:beonecouriers/controllers/profile_controller.dart';
import 'package:beonecouriers/includes/barCard.dart';
import 'package:beonecouriers/includes/menuTabs.dart';
import 'package:beonecouriers/includes/pageLabel.dart';
import 'package:beonecouriers/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const BarCard(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PageLabel(subject: 'My Profile '),
                FutureBuilder(
                    future: profileController.fetchProfile(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text('No information to list here '),
                        );
                      }
                      final data = snapshot.data!;
                      final id = data['data']['id'].toString();
                      final name = data['data']['name'];
                      final email = data['data']['email'];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Column(
                            children: [
                              Text('Identifier : $id'),
                              const SizedBox(height: 10),
                              Text('Name : $name'),
                              const SizedBox(height: 10),
                              Text('Email : $email'),
                            ],
                          ),
                        ),
                      );
                    }),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () async {
                        final SharedPreferences prefs = await _prefs;
                        prefs.clear();
                        Get.offAll(const LoginPage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(255, 159, 67, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
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
          const MenuTabs(selectedIndex: 2),
        ],
      ),
    );
  }
}
