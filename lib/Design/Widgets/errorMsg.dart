

import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:flutter/material.dart';

errorMsg(context,String txt){

  showModalBottomSheet(context: context, builder: (context){
    return Container(
      color: bgClr,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Spacer(flex: 1,),
            Container(
              margin: EdgeInsets.only(bottom: 4),
                child: simpleTxt(txt, 15, darkBlueClr)),
            SizedBox(width: 15,),
            Icon(Icons.error_outline,color: darkBlueClr),

          ],
        ),
      ),
    );
  });

}