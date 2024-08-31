import 'package:beonecouriers/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarCard extends StatefulWidget {
  const BarCard({super.key});

  @override
  State<BarCard> createState() => _BarCardState();
}

class _BarCardState extends State<BarCard> {
  void goHomepage(){
    Get.to(const Homepage());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(95, 39, 205, 1.0),
        ),
        child:  Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                'BeOne Express\nCouriers',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 22),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(14),
                child: GestureDetector(
                  onTap: goHomepage ,
                  child: const Icon(Icons.arrow_back , color: Colors.white,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
