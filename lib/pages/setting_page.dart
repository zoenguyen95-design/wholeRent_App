//Setting Profile page
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_faceid3/pages/editingProfile_widget/user_preferences.dart';

import '../model/user_profile.dart';





class SettingProfilePage extends StatefulWidget {
  const SettingProfilePage({ Key? key }) : super(key: key);

  @override
  State<SettingProfilePage> createState() => _SettingProfilePageState();
}

class _SettingProfilePageState extends State<SettingProfilePage> {
  late User user;

@override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}