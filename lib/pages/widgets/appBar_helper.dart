//https://github.com/Rea2er/flutter-house-rent/blob/main/lib/screen/home/widget/custom_app_bar.dart

//https://www.youtube.com/watch?v=-V8LFrbQdFY&t=17s

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:flutter_svg/svg.dart';



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  //const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

             IconButton(
                 onPressed: (){},
                 icon:  Icon(Icons.menu)),
              //AVATAR
              CircleAvatar(
                child: ClipRRect(
                  child: Image.asset("assets/images/Avatar.jpg", fit: BoxFit.contain,),
                  borderRadius: BorderRadius.all(Radius.circular(10)),

                ),
              )
              //Icon( Icons.menu),
             // CircleAvatar(backgroundImage: AssetImage('assets/images/Avatar.jpg'),)
            ],
          ),
        ));
  }


  @override
   Size get preferredSize => Size.fromHeight(50);
}
