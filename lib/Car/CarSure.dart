
import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/Design/Widgets/AppBarProvider.dart';
import 'package:app/Design/Widgets/Button.dart';
import 'package:app/Design/Widgets/Check.dart';
import 'package:app/Design/Widgets/SemiAppBar.dart';
import 'package:app/Design/Widgets/TextFormFeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarSure extends StatefulWidget {
  const CarSure({Key? key}) : super(key: key);

  @override
  _CarSureState createState() => _CarSureState();
}

class _CarSureState extends State<CarSure> {

  bool tsadGeml = false;
  bool mekef = false;

  List<bool> numbers = [false,false,false,false,false,false];
  List<bool> drivers = [false,false,false];
  List<bool> past = [false,false,false];

  void setCheckPast(int index){
    for(int i =0;i<3 ; i++){
      if(i == index){
        past[i] = true;
        continue;
      }
      past[i] = false;
    }
  }

  void setCheckDrivers(int index){
    for(int i =0;i<3 ; i++){
      if(i == index){
        drivers[i] = true;
        continue;
      }
      drivers[i] = false;
    }
  }

  void setCheckNumbers(int index){
    for(int i =0;i<6 ; i++){
      if(i == index){
        numbers[i] = true;
        continue;
      }
      numbers[i] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.transparent,
      body:
          Column(
            children: [
              AppBarProvider(),

              Expanded(
                child: Container(
                  width: size.width,

                  decoration: BoxDecoration(
                      color:  Color(0xffECEEF3),
                    // borderRadius: BorderRadius.only(
                    //   topLeft: Radius.circular(70),
                    //   topRight: Radius.circular(70),
                    // )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        simpleTxt("ביטוח רכב", 40, darkBlueClr),
                        SizedBox(height: 20,),
                        SizedBox(height: 35,),
                        Row(
                          children: [
                            SizedBox(width: 50,),
                            simpleTxt("נא מלא את השדות הבאות", 15, darkBlueClr),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 40,right: 40),
                          child: FormFeildText("מספר רישוי",Colors.grey[600]!),
                        ),
                        SizedBox(height: 25,),
                        Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 40,right: 40),
                          child: FormFeildText("מספר רישוי",Colors.grey[600]!),
                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            SizedBox(width: 50,),
                            simpleTxt("סוג ביטוח", 15, darkBlueClr),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Material(
                              color:Colors.transparent,
                              child: InkWell(
                                onTap:(){
                                  setState(() {
                                    tsadGeml = true;
                                    mekef = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(

                                      color: tsadGeml ? darkBlueClr : Color(0xffECEEF3),
                                      border: Border.all(color:darkBlueClr,width: 1),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    )
                                  ),
                                  height: 45,
                                  width: size.width/2.6,
                                  child: Center(
                                    child: simpleTxt("חובה + צד ג", 13, tsadGeml ? Colors.white : darkBlueClr),
                                  ),

                                ),
                              ),
                            ),
                            Material(
                              color:Colors.transparent,
                              child: InkWell(
                                onTap:(){
                                  setState(() {
                                    tsadGeml = false;
                                    mekef = true;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: mekef ? darkBlueClr : Color(0xffECEEF3),
                                      border: Border.all(color:  darkBlueClr,width: 1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                      )
                                  ),
                                  height: 45,
                                  width: size.width/2.6,
                                  child: Center(
                                    child: simpleTxt("חובה + מקיף", 13, mekef ? Colors.white : darkBlueClr),
                                  ),

                                ),
                              ),
                            ),
                          ],

                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            SizedBox(width: 50,),
                            simpleTxt("מעל גיל", 15, darkBlueClr),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              color:Colors.transparent,
                              child: InkWell(
                                onTap:(){
                                  setState(() {
                                    setCheckNumbers(0);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(

                                      color: numbers[0] ? darkBlueClr : Color(0xffECEEF3),
                                      border: Border.all(color:darkBlueClr,width: 1),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      )
                                  ),
                                  height: 45,
                                 // width: size.width/2.6,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom: 10,right: 16,left: 16),
                                      child: simpleTxt("16", 13, numbers[0]  ? Colors.white : darkBlueClr),
                                    ),
                                  ),

                                ),
                              ),
                            ),
                            Material(
                              color:Colors.transparent,
                              child: InkWell(
                                onTap:(){
                                  setState(() {
                                    setCheckNumbers(1);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(

                                      color: numbers[1] ? darkBlueClr : Color(0xffECEEF3),
                                      border: Border.all(color:darkBlueClr,width: 1),
                                      // borderRadius: BorderRadius.only(
                                      //   topRight: Radius.circular(15),
                                      //   bottomRight: Radius.circular(15),
                                      // )
                                  ),
                                  height: 45,
                                  // width: size.width/2.6,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom: 10,right: 16,left: 16),
                                      child: simpleTxt("21", 13, numbers[1]  ? Colors.white : darkBlueClr),
                                    ),
                                  ),

                                ),
                              ),
                            ),
                            Material(
                              color:Colors.transparent,
                              child: InkWell(
                                onTap:(){
                                  setState(() {
                                    setCheckNumbers(2);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(

                                    color: numbers[2] ? darkBlueClr : Color(0xffECEEF3),
                                    border: Border.all(color:darkBlueClr,width: 1),
                                    // borderRadius: BorderRadius.only(
                                    //   topRight: Radius.circular(15),
                                    //   bottomRight: Radius.circular(15),
                                    // )
                                  ),
                                  height: 45,
                                  // width: size.width/2.6,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom: 10,right: 16,left: 16),
                                      child: simpleTxt("24", 13, numbers[2]  ? Colors.white : darkBlueClr),
                                    ),
                                  ),

                                ),
                              ),
                            ),
                            Material(
                              color:Colors.transparent,
                              child: InkWell(
                                onTap:(){
                                  setState(() {
                                    setCheckNumbers(3);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(

                                    color: numbers[3] ? darkBlueClr : Color(0xffECEEF3),
                                    border: Border.all(color:darkBlueClr,width: 1),
                                    // borderRadius: BorderRadius.only(
                                    //   topRight: Radius.circular(15),
                                    //   bottomRight: Radius.circular(15),
                                    // )
                                  ),
                                  height: 45,
                                  // width: size.width/2.6,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom: 10,right: 16,left: 16),
                                      child: simpleTxt("30", 13, numbers[3]  ? Colors.white : darkBlueClr),
                                    ),
                                  ),

                                ),
                              ),
                            ),
                            Material(
                              color:Colors.transparent,
                              child: InkWell(
                                onTap:(){
                                  setState(() {
                                    setCheckNumbers(4);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(

                                    color: numbers[4] ? darkBlueClr : Color(0xffECEEF3),
                                    border: Border.all(color:darkBlueClr,width: 1),
                                    // borderRadius: BorderRadius.only(
                                    //   topRight: Radius.circular(15),
                                    //   bottomRight: Radius.circular(15),
                                    // )
                                  ),
                                  height: 45,
                                  // width: size.width/2.6,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom: 10,right: 16,left: 16),
                                      child: simpleTxt("40", 13, numbers[4]  ? Colors.white : darkBlueClr),
                                    ),
                                  ),

                                ),
                              ),
                            ),
                            Material(
                              color:Colors.transparent,
                              child: InkWell(
                                onTap:(){
                                  setState(() {
                                    setCheckNumbers(5);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(

                                    color: numbers[5] ? darkBlueClr : Color(0xffECEEF3),
                                    border: Border.all(color:darkBlueClr,width: 1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    )
                                  ),
                                  height: 45,
                                  // width: size.width/2.6,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom: 10,right: 16,left: 16),
                                      child: simpleTxt("50", 13, numbers[5]  ? Colors.white : darkBlueClr),
                                    ),
                                  ),

                                ),
                              ),
                            ),
                          ],

                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            SizedBox(width: 50,),
                            simpleTxt("מספר נהגים", 15, darkBlueClr),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          color: Colors.transparent,
                          height: 50,
                          margin: EdgeInsets.only(left: 40,right: 40),
                          child: Row(
                            children: [
                              Expanded(
                                child: Material(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                  color:Colors.transparent,
                                  child: InkWell(
                                    onTap: (){
                                      setCheckDrivers(0);
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: drivers[0] ? darkBlueClr : Color(0xffECEEF3),
                                          border: Border.all(color:darkBlueClr,width: 1),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          )
                                      ),

                                      child: Center(
                                        child: simpleTxt("נהג יחיד", 14, drivers[0] ? Colors.white : darkBlueClr),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Material(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                  color:Colors.transparent,
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        setCheckDrivers(1);
                                      });

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: drivers[1] ? darkBlueClr : Color(0xffECEEF3),
                                          border: Border.all(color:darkBlueClr,width: 1),
                                          // borderRadius: BorderRadius.only(
                                          //   topRight: Radius.circular(15),
                                          //   bottomRight: Radius.circular(15),
                                          // )
                                      ),

                                      child: Center(
                                        child: simpleTxt("שני נהגים", 14, drivers[1] ? Colors.white : darkBlueClr),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Material(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                  color:Colors.transparent,
                                  child: InkWell(
                                    onTap: (){
                                      setCheckDrivers(2);
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: drivers[2] ? darkBlueClr : Color(0xffECEEF3),
                                          border: Border.all(color:darkBlueClr,width: 1),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                          )
                                      ),

                                      child: Center(
                                        child: simpleTxt("כל נהג", 14, drivers[2] ? Colors.white : darkBlueClr),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            SizedBox(width: 50,),
                            simpleTxt("עבר ביטוח (במידה ויש)", 15, darkBlueClr),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          color: Colors.transparent,
                          height: 50,
                          margin: EdgeInsets.only(left: 40,right: 40),
                          child: Row(
                            children: [
                              Expanded(
                                child: Material(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                  color:Colors.transparent,
                                  child: InkWell(
                                    onTap: (){
                                      setCheckPast(0);
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: past[0] ? darkBlueClr : Color(0xffECEEF3),
                                          border: Border.all(color:darkBlueClr,width: 1),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          )
                                      ),

                                      child: Center(
                                        child: simpleTxt("שנה אחרונה", 14, past[0] ? Colors.white : darkBlueClr),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Material(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                  color:Colors.transparent,
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        setCheckPast(1);
                                      });

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: past[1] ? darkBlueClr : Color(0xffECEEF3),
                                        border: Border.all(color:darkBlueClr,width: 1),
                                        // borderRadius: BorderRadius.only(
                                        //   topRight: Radius.circular(15),
                                        //   bottomRight: Radius.circular(15),
                                        // )
                                      ),

                                      child: Center(
                                        child: simpleTxt("2 שנים", 14, past[1] ? Colors.white : darkBlueClr),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Material(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                  color:Colors.transparent,
                                  child: InkWell(
                                    onTap: (){
                                      setCheckPast(2);
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: past[2] ? darkBlueClr : Color(0xffECEEF3),
                                          border: Border.all(color:darkBlueClr,width: 1),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                          )
                                      ),

                                      child: Center(
                                        child: simpleTxt("3 שנים", 14, past[2] ? Colors.white : darkBlueClr),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            SizedBox(width: 50,),
                            simpleTxt("פרטי תקשורת (חובה)", 15, darkBlueClr),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 40,right: 40),
                          child: FormFeildText("דוא\"ל",Colors.grey[600]!),
                        ),
                        SizedBox(height: 25,),
                        Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 40,right: 40),
                          child: FormFeildText("מספר פלפון",Colors.grey[600]!),
                        ),
                        SizedBox(height: 60,),
                       Button(context,(){},BorderRadius.circular(15),"שליחת בקשה",size.width * 0.8,40.0,darkBlueClr),
                       // Button(context,size,(){},BorderRadius.circular(15),"שליחת בקשה",size.width * 0.8,40.0,darkBlueClr
                       // ),
                        SizedBox(height: 80,),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}



//
// SingleChildScrollView(
// child: Column(
// children: [
// SizedBox(height: 20,),
// Center(
// child: Text("ביטוח רכב",style: simpleTextStyle(50,Colors.white),textAlign: TextAlign.center,),
// ),
// SizedBox(height: 40,),
// SizedBox(height: 10,),
// Container(
// margin: EdgeInsets.only(left: 32,right: 32),
// child: FormFeildText("מספר רישוי")
// ),
// SizedBox(height: 40,),
// Container(
// margin: EdgeInsets.only(left: 32,right: 32),
// child: FormFeildText("שם בעל הרכב")
// ),
//
// SizedBox(height: 40,),
// Row(
// children: [
// // Spacer(flex:1),
// SizedBox(width: 35,),
// simpleTxt("סוג ביטוח",25,Colors.white),
//
// ],
// ),
// SizedBox(height: 20),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// mekef = true;
// tsadGeml = false;
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: mekef ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("חובה + מקיף", 15, mekef ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// mekef = false;
// tsadGeml = true;
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: tsadGeml ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("חובה + צד ג", 15, tsadGeml ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: 40,),
// Row(
// children: [
// SizedBox(width: 35,),
// simpleTxt("מעל גיל",25,Colors.white),
// ],
// ),
// SizedBox(height: 20),
// Container(
// margin: EdgeInsets.only(left: 32,right: 32),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// setCheckNumbers(0);
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: numbers[0] ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("16", 15, numbers[0] ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// setCheckNumbers(1);
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: numbers[1] ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("21", 15, numbers[1] ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// setCheckNumbers(2);
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: numbers[2] ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("24", 15, numbers[2] ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// ]),
// ),
// SizedBox(height: 15,),
// Container(
// margin: EdgeInsets.only(left: 32,right: 32),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// setCheckNumbers(3);
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: numbers[3] ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("30", 15, numbers[3] ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// setCheckNumbers(4);
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: numbers[4] ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("40", 15, numbers[4] ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// setCheckNumbers(5);
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: numbers[5] ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("50", 15, numbers[5] ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
//
// SizedBox(height: 40,),
// simpleTxt("מספר נהגים",25,darkBlueClr),
// SizedBox(height: 20),
//
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// setCheckDrivers(0);
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: drivers[0] ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("נהג יחיד", 15, drivers[0] ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// setCheckDrivers(1);
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: drivers[1] ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("שני נהגים", 15, drivers[1] ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// setCheckDrivers(2);
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: drivers[2] ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("כל נהג", 15, drivers[2] ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
//
// ],
// ),
//
// SizedBox(height: 40,),
// simpleTxt("מספר נהגים",25,darkBlueClr),
// simpleTxt("נא סמן את התשובות הרלוונטיות עבורך",15,darkBlueClr),
// SizedBox(height: 20),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// setCheckPast(0);
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: past[0] ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("שנה אחרונה", 15, past[0] ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// setCheckPast(1);
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: past[1] ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("שנתיים אחרונות", 15, past[1] ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: 15,),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Material(
// color: Colors.transparent,
// child: InkWell(
// onTap: (){
// setState(() {
// setCheckPast(2);
// });
// },
// child: Row(
// children: [
// Container(
// child: Icon(Icons.circle,color: past[2] ? darkBlueClr : Colors.grey,size: 10,),
// margin: EdgeInsets.only(top: 3),),
// SizedBox(width: 10,),
// simpleTxt("3 שנים אחורה", 15, past[2] ? darkBlueClr : Colors.grey),
// ],
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: 40,),
// simpleTxt("פרטי תקשורת",25,darkBlueClr),
// simpleTxt("(חובה)",15,darkBlueClr),
// SizedBox(height: 40),
// Container(
// margin: EdgeInsets.only(left: 32,right: 32),
// child: FormFeildText("פלפון",number: true)
// ),
// SizedBox(height: 25,),
// Container(
// margin: EdgeInsets.only(left: 32,right: 32),
// child: FormFeildText("דוא\"ל")
// ),
// SizedBox(height: 40,),
// Button(context,size,(){},BorderRadius.circular(5),"שליחת בקשה"),
// SizedBox(height: 40,),
// ],
// ),
// ),
