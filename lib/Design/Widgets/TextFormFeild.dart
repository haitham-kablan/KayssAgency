

import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

FormFeildText(String label,{bool number = false}){
  return TextFormField(
    keyboardType: number ? TextInputType.number : null,
    decoration: InputDecoration(
      focusedBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: darkBlueClr, width: 1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      enabledBorder:OutlineInputBorder(

        borderSide: const BorderSide(color: darkBlueClr, width: 0.3),
        borderRadius: BorderRadius.circular(15.0),
      ),
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey[600 ]),
    ),
    style: GoogleFonts.mPlus1p(
      color: darkBlueClr,fontSize: 13
    ),
  );
}