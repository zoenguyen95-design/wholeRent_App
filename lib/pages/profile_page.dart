import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_faceid3/pages/splash_screen.dart';
import 'package:project_faceid3/pages/widgets/header_widget.dart';
import '../model/user_model.dart';
// import 'home_page1.dart';
import 'package:project_faceid3/views/home.dart';

import 'editingProfile_widget/userProfile_page.dart';

//import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double _drawerIconSize = 30;

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: .5,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 16, right: 16),
            child: Stack(
              children: <Widget>[
                const Icon(Icons.settings),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minHeight: 12,
                      minWidth: 12,
                    ),
                    child: const Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),

// The sidebar navigation
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ])),

          ///content inside
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Hi, ${loggedInUser.userName }",
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              //ITEM 0
              ListTile(
                leading: Icon(
                  Icons.house,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              //OFF ITEM 0

              //ITEM 1
              ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'View Profile',
                  style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePageSharedPr())); //ProfilePage()));
                },
              ), // -OFF ITEM 1

              //ITEM 2
              ListTile(
                leading: Icon(
                  Icons.flag_outlined,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Save Items',
                  style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SplashScreen(title: 'Splash SCREEEN')));
                },
              ),
              //-OFF ITEM 2

              //ITEM 3
              ListTile(
                leading: Icon(
                  Icons.settings,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Setting',
                  style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SplashScreen(title: 'Setting Account')));
                },
              ),

              ///-OFF ITEM 3

              //ITEM 4
              ListTile(
                leading: Icon(
                  Icons.logout,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SplashScreen(title: 'Log Out')));
                },
              ),

              ///-OFF ITEM 4
              // ),
            ],
          ),
        ),
      ),

      //Body of the profile page

      //-------header
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 100,
              child: const HeaderWidget(100, false, Icons.house_sharp),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),

              //------off of header

              //Avatar
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),

                    //Insert user's avatar here - Enable to change image
                    child: Icon(
                      Icons.person,
                      size: 85,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //User's name from the Registration form
                  Text(
                    "${loggedInUser.userName}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'User Information',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),

                        //Card contain for the detail of user infor
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                        color: Colors.grey,
                                        tiles: [
                                          //1st section - Description
                                          const ListTile(
                                              leading: Icon(Icons.person),
                                              title: Text("About Me"),
                                              subtitle: Text(
                                                  "This is a about me link and you can khow about me in this section.")),

                                          //2nd section - Email
                                          ListTile(
                                            leading: const Icon(Icons.email),
                                            title: const Text("Email"),
                                            subtitle:
                                                Text("${loggedInUser.email}"),
                                          ),

                                          //3rd section - Phone
                                          const ListTile(
                                            leading: Icon(Icons.phone),
                                            title: Text("Phone"),
                                            subtitle: Text("778-951-6472"),
                                          ),

                                          //4th section - Location
                                          const ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 4),
                                            leading: Icon(Icons.my_location),
                                            title: Text("Location"),
                                            subtitle: Text("BC"),
                                          )
                                        ]),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
