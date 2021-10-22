
import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';

import 'package:app/Design/Widgets/Links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



FullAppBar(){
  return  AppBar(
    backgroundColor: backGroundClr,
    title: Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          AppBarText("Kayss Agency"),
          ExplainText("ביטוח ותיירות בארץ ובעולם",10),
        ],
      ),
    ),
    actions: [
      IconButton(onPressed: ()async{
        try{
          await launchUniversalLinkIos(whatsLink);
        }catch(e){
          //TODO : error
        }

      }, icon: Icon(Icons.call,color: SecondaryTextColor,size: 15,)),
      IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_outlined,color: SecondaryTextColor,size: 15,)),
      SizedBox(width: 15,),
    ],
  );
}
