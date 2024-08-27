import 'package:flutter/material.dart';

class MenuCards extends StatefulWidget {
  final IconData cardIcon;
  final String cardLabel;
  const MenuCards({
    super.key,
    required this.cardIcon,
    required this.cardLabel
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
