

import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/Design/Widgets/AppBarProvider.dart';
import 'package:app/Design/Widgets/Button.dart';
import 'package:app/Design/Widgets/TextFormFeild.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelPayment extends StatefulWidget {
  const HotelPayment({Key? key}) : super(key: key);

  @override
  _HotelPaymentState createState() => _HotelPaymentState();
}

class _HotelPaymentState extends State<HotelPayment> {
  
  List<String> hotelPics = [
    "assets/stamPics/1.png",
    "assets/stamPics/2.png",
    "assets/stamPics/3.png",
    "assets/stamPics/4.png",
  ];

  int current = 0;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: bgClr,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: darkBlueClr,
            elevation: 0,
            title: Image.asset("assets/logo.png",height: 65,width: 100,),
            actions: [
              IconButton(onPressed: (){
               Navigator.pop(context);
              }, icon: Icon(Icons.chevron_right,color: Colors.white,),),
              SizedBox(width: 10,),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: 235,
                  child: Stack(
                    children: [
                      Container(
                        height: 235,
                          width: size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(hotelPics[current]),fit: BoxFit.fill
                          )
                        ),
                      ),
                      Container(
                        height: 235,
                        width: size.width,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Container(
                        height: 235,
                        width: size.width,
                        child: Column(
                          children: [
                            Spacer(flex: 2,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(icon:Icon(Icons.chevron_left,color: Colors.white,size: 30,),onPressed: (){
                                  setState(() {

                                    current = current == hotelPics.length -1 ? 0 : current +1;
                                  });
                                },),
                                IconButton(icon:Icon(Icons.chevron_right,color: Colors.white,size: 30,),onPressed: (){
                                  setState(() {
                                    current = current == 0 ? hotelPics.length -1 : current -1;
                                  });

                                },),

                              ],
                            ),
                            Spacer(flex: 1,),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Spacer(flex: 1,),
                                  simpleTxt("Germany Hilton Hotel", 25, Colors.white),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Spacer(flex: 1,),
                                  Icon(Icons.star,color: goldClr,size: 17,),
                                  Icon(Icons.star,color: goldClr,size: 17,),
                                  Icon(Icons.star,color: goldClr,size: 17,),
                                  Icon(Icons.star,color: goldClr,size: 17,),
                                  Icon(Icons.star,color: goldClr,size: 17,),
                                ],
                              ),
                            ),

                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Spacer(flex: 1,),
                    simpleTxt("20/10/2021 - 25/10/2021", 12, darkBlueClr),
                    SizedBox(width: 20,),

                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 18,),
                    simpleTxt("מחיר לזוג", 15, darkBlueClr),

                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 18,),
                    Text("1200 ש\"ח",style: GoogleFonts.mPlus1p(
                      color: darkBlueClr,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
               // SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 18,),
                    simpleTxt("תוספת ילדים", 15, darkBlueClr),
                    Spacer(flex: 1,),
                        IconButton(onPressed: (){
                          setState(() {
                            counter++;
                          });
                        }, icon: Icon(Icons.arrow_drop_up,color: darkBlueClr,size: 12,)),
                    Text(counter.toString(),style: GoogleFonts.mPlus1p(
                        color: darkBlueClr,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),),
                        IconButton(onPressed: (){
                          setState(() {
                            if(counter == 0){
                              return;
                            }
                            counter--;
                          });
                        }, icon: Icon(Icons.arrow_drop_down,color: darkBlueClr,size: 12)),
                    SizedBox(width: 5,),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 0.1,
                  width: size.width,
                  color: Colors.grey,
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/hotelLux/pool.png",width: 20,height: 20,),
                        simpleTxt("בריכת שחייה", 12, darkBlueClr),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/hotelLux/gym.png",width: 20,height: 20,),
                        simpleTxt("חדר כושר", 12, darkBlueClr),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/hotelLux/spa.png",width: 20,height: 20,),
                        simpleTxt("spa", 12, darkBlueClr),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/hotelLux/wifi.png",width: 20,height: 20,),
                        simpleTxt("אנטרניט", 12, darkBlueClr),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  height: 0.1,
                  width: size.width,
                  color: Colors.grey,
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 18,),
                    simpleTxt("פרטים אישיים", 15, darkBlueClr),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 18,),
                    simpleTxt("(נא למלא כפי שרשום בדרכון)", 12, darkBlueClr),
                  ],
                ),
                SizedBox(height: 35,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    simpleTxt("בן אדם ראשון", 12, darkBlueClr),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 18,right: 18),
                  child: FormFeildText("שם באנגלית (כפי שמופיע בדרכון)"),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 18,right: 18),
                  child: FormFeildText("שם משפחה באנגלית (כפי שמופיע בדרכון)"),
                ),
                SizedBox(height: 35,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    simpleTxt("בן אדם שני", 12, darkBlueClr),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 18,right: 18),
                  child: FormFeildText("שם באנגלית (כפי שמופיע בדרכון)"),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 18,right: 18),
                  child: FormFeildText("שם משפחה באנגלית (כפי שמופיע בדרכון)"),
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 18,),
                    simpleTxt("פרטי תקשורת (חובה) ", 15, darkBlueClr),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 18,right: 18),
                  child: FormFeildText("מספר פלפון"),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 18,right: 18),
                  child: FormFeildText("דוא\"ל"),
                ),
                SizedBox(height: 50,),


                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    simpleTxt("סה\"כ לתשלום", 15, darkBlueClr),
                    simpleTxt("1200 ש\"ח", 30, darkBlueClr),
                  ],
                ),
                SizedBox(height: 20,),
                Button(context,(){
                  showModalBottomSheet(context: context, builder: (_){

                    return Container(
                      width: size.width,
                   //   height: size.height * 0.7,
                      decoration: BoxDecoration(
                          color: bgClr,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )
                      ),

                      child: Column(
                        children: [
                          Directionality(
                            child: Container(
                              width: size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: simpleTxt("סה\"כ לתשלום:", 15, Colors.white),
                                    ),
                                    Center(
                                      child: simpleTxt("1200 ש\"ח", 25, Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: darkBlueClr,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  )
                              ),
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          SizedBox(height: 15,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              simpleTxt("נא בחר את שיטת התשלום המועדפת עליך", 15, darkBlueClr),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  PaymentMethod(size: size, onTap: (){}, imagePath: "assets/payment/payment.png",name:"אונליין"),
                                  PaymentMethod(size: size, onTap: (){}, imagePath: "assets/payment/transfer.png",name:"העברה בנקאית"),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: size.width * 0.3,
                                    height: size.height * 0.15,
                                  ),
                                  PaymentMethod(size: size, onTap: (){}, imagePath: "assets/payment/contact.png",name:"יצירת קשר"),

                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }, shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),);
                },BorderRadius.circular(15),"מעבר לתשלום",size.width * 0.9,40.0,darkBlueClr),
                SizedBox(height: 50,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


class PaymentMethod extends StatefulWidget {
  final Size size;
  final onTap;
  final imagePath;
  final name;
  const PaymentMethod({Key? key, required this.size, required this.onTap, required this.imagePath, required this.name}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState(size,onTap,imagePath,name);
}

class _PaymentMethodState extends State<PaymentMethod> {

  final Size size;
  final onTap;
  final imagePath;
  final name;

  _PaymentMethodState(this.size, this.onTap, this.imagePath, this.name);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: size.width * 0.3,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: darkBlueClr,width: 0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 1,),
          Image.asset(imagePath,width: 55,height: 55,),
          Spacer(flex: 1,),
          simpleTxt(name, 13, darkBlueClr),
          Spacer(flex: 1,),
        ],
      ),
    );
  }
}









