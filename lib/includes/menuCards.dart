import 'package:beonecouriers/homepage.dart';
import 'package:beonecouriers/pickableShipments.dart';
import 'package:beonecouriers/profilePage.dart';
import 'package:beonecouriers/runableShipments.dart';
import 'package:flutter/material.dart';

class MenuCards extends StatefulWidget {
  final IconData cardIcon;
  final String cardLabel;
  final int cardIndex;
  const MenuCards({
    super.key,
    required this.cardIcon,
    required this.cardLabel,
    required this.cardIndex
    });

  @override
  State<MenuCards> createState() => _MenuCardsState();
}

class _MenuCardsState extends State<MenuCards> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: ( (){
            switch (widget.cardIndex){
              case 0 : 
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RunableShipments()));
              case 1 :
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PickableShipments()));
            }
        }),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Icon(widget.cardIcon , size: 55, color: Theme.of(context).primaryColor,),
                Text(widget.cardLabel , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 14  , color: Theme.of(context).primaryColor),)
                ],
            ),
          ),
        ),
      ),
    );
  }
}
