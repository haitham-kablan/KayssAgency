
import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/Design/Widgets/AppBarProvider.dart';
import 'package:app/Design/Widgets/Button.dart';
import 'package:app/Design/Widgets/Check.dart';
import 'package:app/Design/Widgets/SemiAppBar.dart';
import 'package:app/Design/Widgets/TextFormFeild.dart';
import 'package:app/Design/Widgets/errorMsg.dart';
import 'package:app/Screens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



class CarSure extends StatefulWidget {
  const CarSure({Key? key}) : super(key: key);

  @override
  _CarSureState createState() => _CarSureState();
}

class _CarSureState extends State<CarSure> {

  bool tsadGeml = false;
  bool mekef = false;

  bool isLoading = false;
  bool check = false;

  bool past1 = false;
  bool past2 = false;
  bool past3 = false;

  List<bool> numbers = [false,false,false,false,false,false];
  List<bool> drivers = [false,false,false];


  TextEditingController reshoe = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return darkBlueClr;
    }
    return darkBlueClr;
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: darkBlueClr,
        body:
            Column(
              children: [
                AppBarProvider(index: 4),

                Expanded(
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color:  Color(0xffECEEF3),
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
                            child: FormFeildText("מספר רישוי (חובה)",Colors.grey[600]!,controler: reshoe),
                          ),
                          SizedBox(height: 25,),
                          Container(
                            height: 45,
                            margin: EdgeInsets.only(left: 40,right: 40),
                            child: FormFeildText("שם בעל האוטו (חובה)",Colors.grey[600]!,controler: name),
                          ),

                          SizedBox(height: 40,),
                          Row(
                            children: [
                              SizedBox(width: 50,),
                              simpleTxt("סוג ביטוח  (חובה)", 15, darkBlueClr),
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
                              simpleTxt("מעל גיל  (חובה)", 15, darkBlueClr),
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
                              simpleTxt("מספר נהגים  (חובה)", 15, darkBlueClr),
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
                          Row(
                            children: [
                              SizedBox(width: 50,),
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: past1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    past1 = value!;
                                  });
                                },
                              ),
                              simpleTxt("שנה אחרונה", 15, darkBlueClr),
                            ],
                          ),
                         // SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 50,),
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: past2,
                                onChanged: (bool? value) {
                                  setState(() {
                                    past2 = value!;
                                  });
                                },
                              ),
                              simpleTxt("שנתיים אחרונות", 15, darkBlueClr),
                            ],
                          ),
                         // SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 50,),
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: past3,
                                onChanged: (bool? value) {
                                  setState(() {
                                    past3 = value!;
                                  });
                                },
                              ),
                              simpleTxt("שלוש שנים אחורה", 15, darkBlueClr),
                            ],
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
                            child: FormFeildText("דוא\"ל",Colors.grey[600]!,controler: email),
                          ),
                          SizedBox(height: 25,),
                          Container(
                            height: 45,
                            margin: EdgeInsets.only(left: 40,right: 40),
                            child: FormFeildText("מספר פלפון",Colors.grey[600]!,number: true,controler: phone),
                          ),
                          SizedBox(height: 60,),
                         isLoading ? CircularProgressIndicator(
                           color: darkBlueClr,
                         ): check ? Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Container(
                                 child: Icon(Icons.check,color: darkBlueClr,size: 15,),

                             width: 30,
                             height: 30,
                             decoration: BoxDecoration(
                               color: Colors.transparent,
                               border: Border.all(width: 1,color: darkBlueClr),
                               shape: BoxShape.circle,
                             ),),
                             SizedBox(height: 10,),
                             Container(
                                 width:size.width * 0.7,
                                 child: Text("תודה על הפנייה , הבקשה שלך נקלטה בהצלחה , נחזור אליך בהקדם האפשרי",style: simpleTextStyle(15, darkBlueClr),textAlign: TextAlign.center,)),
                             SizedBox(height: 15,),
                             Button(context, (){
                               Provider.of<toggleProvider>(context,listen: false).setToggle(4);
                             }, BorderRadius.circular(15),"חזרה",size.width * 0.3,30.0,darkBlueClr),
                           ],
                         ) : Button(context,()async{

                           if(reshoe.text.isEmpty || name.text.isEmpty || phone.text.isEmpty || email.text.isEmpty
                           ||(!tsadGeml && !mekef) || !numbers.any((element) => true) || !drivers.any((element) => true)){
                             errorMsg(context,'נא מלא את כל השדות החיוניים');
                             return;

                           }
                           setState(() {
                             isLoading = true;
                           });

                           await Future.delayed(Duration(milliseconds: 1000));

                           setState(() {
                             isLoading = false;
                             check = true;
                           });

                         },BorderRadius.circular(15),"שליחת בקשה",size.width * 0.8,40.0,darkBlueClr),
                          SizedBox(height: 80,),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}

