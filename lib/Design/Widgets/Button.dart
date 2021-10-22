
import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:flutter/material.dart';

Widget Button(context,onTap,borderRaduis,String txt,double width,double height,Color color){

  return Material(
    elevation: 10,
    shadowColor: color,
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRaduis,
          color: color,
        ),
        child: Center(
        child: simpleTxt(txt, 17, Colors.white),
        )
      ),
    ),
  );

}