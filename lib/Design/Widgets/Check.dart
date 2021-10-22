

import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Check extends StatefulWidget {
  final String text;
  const Check({Key? key, required this.text}) : super(key: key);

  @override
  _CheckState createState() => _CheckState(text);
}

class _CheckState extends State<Check> {
  final String text;
  bool isChecked = false;

  _CheckState(this.text);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          setState(() {
            isChecked = !isChecked;
          });
        },
        child: Row(
          children: [
            Icon(Icons.circle,color: isChecked ? goldClr : Colors.grey,size: 12,),
            SizedBox(width: 10,),
            simpleTxt(text, 20, isChecked ? goldClr : Colors.grey),


          ],
        ),
      ),
    );
  }
}
