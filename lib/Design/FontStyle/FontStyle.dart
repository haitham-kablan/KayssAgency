

import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text AppBarText(String txt){
  return Text(
    txt,
    style: GoogleFonts.roboto(
      color: MainTextColor,
      fontSize: 20,
    ),
  );
}



Text TilePhotoText(String txt){
  return Text(
    txt,
    style: GoogleFonts.openSansCondensed(
      color: MainTextColor,
      fontSize: 16,
    ),
    textAlign: TextAlign.center,
  );
}


Text MainText(String txt,double size){
  return Text(
    txt,
    style: GoogleFonts.mPlus1p(
      color: MainTextColor,
      fontSize: size,
    ),
  );
}


Text ExplainText(String txt,double size){
  return Text(
    txt,
    style: GoogleFonts.mPlus1p(
      color: goldClr,
      fontSize: size,
    ),
  );
}


Text goldText(String txt,double size){
  return Text(
    txt,
    style: GoogleFonts.mPlus1p(
      color: goldClr,
      fontSize: size,
    ),
  );
}

Text whiteText(String txt,double size){
  return Text(
    txt,
    style: GoogleFonts.mPlus1p(
      color: MainTextColor,
      fontSize: size,
    ),
  );
}

Text simpleTxt(String txt,double size,Color color){
  return Text(
    txt,
    style: GoogleFonts.mPlus1p(
      color: color,
      fontSize: size,
    ),
  );
}

TextStyle simpleTextStyle(double size,Color color){
  return GoogleFonts.mPlus1p(
    color: color,
    fontSize: size,
  );
}

