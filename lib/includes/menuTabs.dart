import 'package:beonecouriers/homepage.dart';
import 'package:beonecouriers/includes/copyRights.dart';
import 'package:beonecouriers/profilePage.dart';
import 'package:flutter/material.dart';

class MenuTabs extends StatefulWidget {
  final int selectedIndex  ;

  const MenuTabs({
    super.key,
    required this.selectedIndex
  });

  @override
  State<MenuTabs> createState() => _MenuTabs();
}

class _MenuTabs extends State<MenuTabs> {

  int indexed = -1 ; 
  
  void _onItemTapped(int index) {  
    setState(() {  
      indexed = index;  
    });  
    if( indexed == 0 ){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Homepage()));
    }else if ( indexed == 2 ){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage()));
    }
  }  

  
  @override
  Widget build(BuildContext context) {
 

    return  Column(
      children: [
        const Padding(
          padding:  EdgeInsets.all(8.0),
          child:  Center(
            child: CopyRightsShared(),
          ),
        ),
        BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(  
                          icon: Icon(Icons.home),  
                          label: 'Home',  
                      ),   
                      BottomNavigationBarItem(  
                        icon: Icon(Icons.map),  
                        label: 'Map',  
                      ),  
                      BottomNavigationBarItem(  
                        icon: Icon(Icons.person),  
                        label: 'Profile',  
                      ),  
                  ],
                  type: BottomNavigationBarType.fixed,
                  currentIndex: indexed == -1 ?  widget.selectedIndex : indexed,
                  selectedItemColor: Theme.of(context).primaryColor,
                  elevation: 4,
                  onTap:  _onItemTapped,
                ),
      ],
    );
  }
}