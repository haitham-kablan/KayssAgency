

import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

FormFeildText(String label, Color labelClr,{bool number = false,Color borderClr = darkBlueClr ,Color txtColor = darkBlueClr,controler = null,bool secure = false}){
  return TextFormField(
    obscureText: secure,
    controller: controler,
    keyboardType: number ? TextInputType.number : null,
    decoration: InputDecoration(
      focusedBorder:OutlineInputBorder(
        borderSide:  BorderSide(color: borderClr, width: 1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      enabledBorder:OutlineInputBorder(

        borderSide:  BorderSide(color: borderClr, width: 0.3),
        borderRadius: BorderRadius.circular(15.0),
      ),
      labelText: label,
      labelStyle: TextStyle(color: labelClr),
    ),
    style: GoogleFonts.mPlus1p(
      color: txtColor,fontSize: 13
    ),
  );
}