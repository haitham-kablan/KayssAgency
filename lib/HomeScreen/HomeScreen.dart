import 'dart:math';

import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/Design/Widgets/Button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({Key? key}) : super(key: key);
  var rnd = new Random();

  final List<String> images = [
    "assets/homeBackGround/1.png",
    "assets/homeBackGround/2.png",
    "assets/homeBackGround/3.png",
    "assets/homeBackGround/4.png",
    "assets/homeBackGround/5.png",
    "assets/homeBackGround/6.png",
    "assets/homeBackGround/7.png",
    "assets/homeBackGround/8.png",
    "assets/homeBackGround/9.png",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: CarouselSlider(
              items: images.map((e) => Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    color: darkBlueClr,
                    image: DecorationImage(
                        image: AssetImage(
                           e
                        ),fit: BoxFit.fill
                    )
                ),
              ),).toList(),
              options: CarouselOptions(
                  height: size.height,
                viewportFraction: 1,
                initialPage: rnd.nextInt(9),
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 10),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.slowMiddle,

              ),

            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            color: darkBlueClr.withOpacity(0.14),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff010715).withOpacity(0.1),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Image.asset("assets/logo.png",height: 100,width: 100,),
                    Spacer(flex: 1,),
                    IconButton(onPressed: (){
                      ZoomDrawer.of(context)!.toggle();
                    }, icon: Icon(Icons.call ,color: Colors.white,size: 20,)),
                    SizedBox(width: 5,),
                    IconButton(onPressed: (){
                      ZoomDrawer.of(context)!.toggle();
                    }, icon: Icon(Icons.menu ,color: Colors.white,size: 20,)),
                    SizedBox(width: 20,),
                  ],
                ),
                Spacer(flex: 1,),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      height: 140,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: darkBlueClr.withOpacity(0.7),
                        // borderRadius: BorderRadius.only(
                        //   topRight: Radius.circular(60),
                        //   topLeft: Radius.circular(60),
                        // )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //   SizedBox(height: 45,),
                          RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                    text:"עדיין אין לך משתמש?",style: simpleTextStyle(13, Colors.white)),
                                TextSpan(
                                    text:" הרשמה",style: simpleTextStyle(13, blueClr)),
                              ]
                          )),
                          // Spacer(flex: 1,),
                          SizedBox(height: 10,),
                          Button(context, (){
                            showModalBottomSheet(context: context, builder: (context){
                              return Container(
                                color: Colors.red,
                                width: size.width,
                                height: 400,
                              );
                            });
                          }, BorderRadius.circular(15), "כניסה",size.width * 0.35,30,blueClr),
                          SizedBox(height: 25,),
                          //
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset("assets/person.png",width: 75,height: 75,)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
