import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_faceid3/pages/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'dart:ui';

import 'package:project_faceid3/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginUI());
}

class LoginUI extends StatelessWidget {
  final Color _primaryColor = HexColor('#fd813e');
  final Color _accentColor = HexColor('#eb5402');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WholeRent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: const Color(0xFFF5F6F6),
        primaryColor: _primaryColor,
        textTheme: TextTheme(
          headline1: const TextStyle(
            color: Color(0xFF100E34),
          ),
          bodyText1: TextStyle(color: const Color(0xFF100E34).withOpacity(0.5)),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: _accentColor),
      ),
      //home:  SplashScreen.routeName,
      initialRoute: SplashScreen.routeName,
      routes: routes
    );
  }
}
