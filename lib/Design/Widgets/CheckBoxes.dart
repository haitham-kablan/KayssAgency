
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxe extends StatefulWidget {

  final String title;
  final Color clr;
  final int index;
  List<bool> list;
  final update;
  CheckBoxe({Key? key, required this.title, required this.clr, required this.update,required this.list, required this.index}) : super(key: key);

  @override
  _CheckBoxeState createState() => _CheckBoxeState(title,clr,index,update,list);
}

class _CheckBoxeState extends State<CheckBoxe> {

  final String title;
  final Color clr;
  final int index;
  List<bool> list;
  final update;

  _CheckBoxeState(this.title, this.clr, this.index, this.update,this.list);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: update(index,list),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: clr,
          ),
          width: 100,
          height: 50,
          child: Center(
            child: simpleTxt(title, 12, Colors.white),
          ),
        ),
      ),
    );
  }
}
