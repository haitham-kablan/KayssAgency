
import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/Design/Widgets/Button.dart';
import 'package:app/Design/Widgets/Check.dart';
import 'package:app/Design/Widgets/SemiAppBar.dart';
import 'package:app/Design/Widgets/TextFormFeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LifeSure extends StatefulWidget {
  const LifeSure({Key? key}) : super(key: key);

  @override
  _LifeSureState createState() => _LifeSureState();
}

class _LifeSureState extends State<LifeSure> {

  bool male = false;
  bool female = false;
  bool smoke = false;
  bool noSmoke = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: SemiAppBar(context),
      backgroundColor: backGroundClr,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child: Text("ביטוח חיים\\בריאות",style: simpleTextStyle(50,MainTextColor),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 40,),
            SizedBox(height: 10,),
            Container(
                margin: EdgeInsets.only(left: 32,right: 32),
                child: FormFeildText("שם מלא")
            ),

            SizedBox(height: 40,),
            simpleTxt("מין",25,SecondaryTextColor),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        male = true;
                        female = false;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.circle,color: male ? goldClr : Colors.grey,size: 10,),
                          margin: EdgeInsets.only(top: 3),),
                        SizedBox(width: 10,),
                        simpleTxt("זכר", 15, male ? goldClr : Colors.grey),
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        male = false;
                        female = true;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.circle,color: female ? goldClr : Colors.grey,size: 10,),
                          margin: EdgeInsets.only(top: 3),),
                        SizedBox(width: 10,),
                        simpleTxt("נקבה", 15, female ? goldClr : Colors.grey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),
            simpleTxt("סטטוס",25,SecondaryTextColor),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        smoke = true;
                        noSmoke = false;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.circle,color: smoke ? goldClr : Colors.grey,size: 10,),
                          margin: EdgeInsets.only(top: 3),),
                        SizedBox(width: 10,),
                        simpleTxt("מעשן", 15, smoke ? goldClr : Colors.grey),
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        smoke = false;
                        noSmoke = true;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.circle,color: noSmoke ? goldClr : Colors.grey,size: 10,),
                          margin: EdgeInsets.only(top: 3),),
                        SizedBox(width: 10,),
                        simpleTxt("לא מעשן", 15, noSmoke ? goldClr : Colors.grey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),
            Container(
                margin: EdgeInsets.only(left: 32,right: 32),
                child: FormFeildText("גיל",number: true)
            ),
            SizedBox(height: 25,),
            Container(
                margin: EdgeInsets.only(left: 32,right: 32),
                child: FormFeildText("עיסוק")
            ),
            SizedBox(height: 40,),
          //  Button(context,size,(){},BorderRadius.circular(5),"שליחת בקשה"),
            SizedBox(height: 40,),
          ],
        ),
      ),

    );
  }
}
