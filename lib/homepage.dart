import 'package:flutter/material.dart';
import 'includes/menuTabs.dart';
import 'includes/pageLabel.dart';
import 'includes/menuCards.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

 
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color:Color.fromARGB(61, 255, 255, 255),
                          ),
                        );

   return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(95, 39, 205,1.0), 
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text('BeOne Express\nCouriers' , style: TextStyle(fontWeight: FontWeight.w700 , color: Colors.white , fontSize: 22),),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color:Colors.white),
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.white,
                        enabledBorder: border,
                        focusedBorder: border,
                       ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const PageLabel(subject: 'Homepage'),
           Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text('Welcome Back : ', style:  TextStyle( color:Theme.of(context).primaryColor , fontWeight: FontWeight.bold) ,),
                ),
                   const Row(
                      children: [
                        Expanded(
                          child: MenuCards(cardIndex: 0 , cardIcon:  Icons.handshake, cardLabel: 'Runable Shipments',),
                          ),
                          Expanded(
                          child: MenuCards(cardIndex: 1  ,cardIcon: Icons.track_changes, cardLabel: 'Pickable Shipments',),
                          ),
                      ],
                  ),
              ],
            ) ,
          ),
          const MenuTabs(selectedIndex: 0),
        ],
      ) ,
    );
  }
}