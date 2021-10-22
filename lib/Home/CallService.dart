import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CallService extends StatelessWidget {
  const CallService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: bgClr,
          body: Column(
            children: [
            Container(
            color: darkBlueClr,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Image.asset("assets/logo.png",height: 55,width: 100,),
                  Spacer(flex: 1,),
                  IconButton(onPressed: (){
                    ZoomDrawer.of(context)!.toggle();
                  }, icon: Icon(Icons.menu,color: Colors.white,),),
                ],
              ),
            ),
          ),
              SizedBox(height: 15,),
              simpleTxt("יצירת קשר", 50, darkBlueClr),
              simpleTxt("נשמח לשרת אותכם", 15, darkBlueClr),
              Spacer(flex: 1,),
              Container(
                margin: EdgeInsets.only(right: size.width * 0.1),
                child:Row(
                  children: [
                    SizedBox(width: 25,),
                    Container(
                      decoration: BoxDecoration(
                        color: darkBlueClr,
                        shape: BoxShape.circle,
                      ),
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Icon(Icons.phone_android,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 15,),
                    simpleTxt("054-5522973", 17, darkBlueClr)
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.only(right: size.width * 0.1),
                child:Row(
                  children: [
                    SizedBox(width: 25,),
                    Container(
                      decoration: BoxDecoration(
                        color: darkBlueClr,
                        shape: BoxShape.circle,
                      ),
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Icon(Icons.phone_android,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 15,),
                    simpleTxt("054-5522973", 17, darkBlueClr)
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.only(right: size.width * 0.1),
                child:Row(
                  children: [
                    SizedBox(width: 25,),
                    Container(
                      decoration: BoxDecoration(
                        color: darkBlueClr,
                        shape: BoxShape.circle,
                      ),
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Icon(Icons.mail,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 15,),
                    simpleTxt("haitham@gmail.com", 17, darkBlueClr)
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.only(right: size.width * 0.1),
                child:Row(
                  children: [
                    SizedBox(width: 25,),
                    Container(
                      decoration: BoxDecoration(
                        color: darkBlueClr,
                        shape: BoxShape.circle,
                      ),
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Icon(Icons.call,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 15,),
                    simpleTxt("04-9802683", 17, darkBlueClr)
                  ],
                ),
              ),
             Spacer(flex: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/insta.png",width: 40,height: 40,),
                  SizedBox(width: 20,),
                  Image.asset("assets/facebook.png",width: 40,height: 40,),
                  SizedBox(width: 20,),
                  Image.asset("assets/whatsapp.png",width: 40,height: 40,),
                ],
              ),
              SizedBox(height: 55,),
            ],
          ),
        )
      ),
    );
  }
}
