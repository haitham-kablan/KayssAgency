

import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


SemiAppBar(context){
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Container(
      margin: EdgeInsets.only(right: 15),
      child: Image.asset("assets/logo.png",height: 100,width: 100,),
    ),
    automaticallyImplyLeading: false,
    actions: [
      IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.chevron_right,color: SecondaryTextColor,size: 25,)),
      SizedBox(width: 15,),
    ],
  );
}