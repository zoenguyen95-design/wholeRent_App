import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_faceid3/pages/home_page.dart';
import 'package:project_faceid3/pages/login_page.dart';
import 'package:project_faceid3/pages/profile_page.dart';
import 'package:project_faceid3/pages/registration_page.dart';








class CustomBottomNavigationBar extends StatefulWidget {
 // const CustomBottomNavigationBar({Key? key}) : super(key: key);




  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {


  int _selectedIndex =0;
  List<Widget> screens = <Widget>[


    HomePage(),
    ProfilePage(),
    RegistrationPage(),
    LoginPage()

  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child: screens.elementAt(_selectedIndex),),
      bottomNavigationBar:  BottomNavigationBar(
          items: const <BottomNavigationBarItem>[


        BottomNavigationBarItem(icon: Icon(Icons.home),  label: 'Hommee' ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.chat_rounded), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
    ),


      

        






      

    );
  }
}

/*
class CustomBottomNavigationBar extends StatefulWidget {
  /*final bottomBarItem = [
    'home',
    'home_search',
    'notification',
    'chat',
    'home_mark'
  ];*/

  int _selectedIndex =0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text('Search'),
    Text('Notification'),
    Text('Chat'),
    Text('Save Item')

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(),
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),


     
    
    );
  }



}*/
