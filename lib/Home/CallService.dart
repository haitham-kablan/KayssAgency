import 'package:app/Design/Animation/Animation.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/Providers/AuthProvider.dart';
import 'package:app/utils/urlLauncher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

import '../logInScreen.dart';
import 'HomePage.dart';


class CallService extends StatefulWidget {
  const CallService({Key? key}) : super(key: key);

  @override
  _CallServiceState createState() => _CallServiceState();
}

class _CallServiceState extends State<CallService> {
  MenuItem currentItem = MenuItems.call;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            key: _scaffoldKey,
            drawer: Drawer(
              backgroundColor: Theme.of(context).colorScheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...MenuItems.MenuItemList.map(
                          (e) => Container(
                        decoration: BoxDecoration(
                          color: e == currentItem ? darkBlueClr.withOpacity(0.1): Colors.transparent,
                          border: Border(
                            bottom: BorderSide(color: darkBlueClr,width: 0.2),
                          ),
                        ),
                        child: ListTile(
                            selected: e == currentItem,
                            leading: Image.asset(e.ImagePath,width: 20,height: 20,),
                            title: simpleTxt(e.name, 16, darkBlueClr),
                            minLeadingWidth: 20,
                            onTap: (){
                              setState(() {
                                if(currentItem == e){
                                  Navigator.pop(context);
                                  return;
                                }
                                currentItem = e;
                                Navigator.pushReplacement(context, CustomPageRoute(child: getScreen()!));
                              });

                            }

                        ),
                      )
                  ).toList(),
                  Spacer(flex: 1,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/blueLogo.png",width: 200,height: 100,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Material(
                          child: InkWell(
                              onTap: (){
                                faceLuncher(context);
                              },
                              child: Image.asset("assets/facebook.png",width: 30,height: 30,))),
                      SizedBox(width: 10,),
                      Material(
                          child: InkWell(
                              onTap: (){
                                instaLuncher(context);
                              },
                              child: Image.asset("assets/insta.png",width: 30,height: 30,))),
                    ],
                  ),
                  SizedBox(height: 80,),
                ],
              ),
            ),
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
                        IconButton(onPressed: (){
                          _scaffoldKey.currentState!.openDrawer();
                        }, icon: Icon(Icons.menu,color: Colors.white,),),
                        Spacer(flex: 1,),
                        Image.asset("assets/logo.png",height: 55,width: 100,),


                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                simpleTxt("יצירת קשר", 50, darkBlueClr),
                simpleTxt("נשמח לשרת אותכם", 15, darkBlueClr),
                Spacer(flex: 1,),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      launchURL("tel:0522741815",context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: size.width * 0.1),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          simpleTxt("052-2741815", 17, darkBlueClr),
                          SizedBox(width: 10,),
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
                          SizedBox(width: 50,),

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      launchURL("tel:0505369687",context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: size.width * 0.1),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          simpleTxt("050-5369687", 17, darkBlueClr),
                          SizedBox(width: 10,),
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
                          SizedBox(width: 50,),

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      launchURL("tel:049802785",context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: size.width * 0.1),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          simpleTxt("04-9802785", 17, darkBlueClr),
                          SizedBox(width: 20,),
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

                          SizedBox(width: 50,),

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.only(left: size.width * 0.1),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      simpleTxt("tourism@kayss-agency.co.il", 17, darkBlueClr),
                      SizedBox(width: 10,),
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

                      SizedBox(width: 50,),


                    ],
                  ),
                ),
                SizedBox(height: 30,),

                Spacer(flex: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                        color: Colors.transparent,
                        child: InkWell(
                        onTap: (){
                          instaLuncher(context);
                        },
                        child: Image.asset("assets/insta.png",width: 40,height: 40,))),
                    SizedBox(width: 20,),
                    Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: (){
                              faceLuncher(context);
                            },
                            child: Image.asset("assets/facebook.png",width: 40,height: 40,))),
                    SizedBox(width: 20,),
                    Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: (){
                              whatsLuncher(context);
                            },
                            child: Image.asset("assets/whatsapp.png",width: 40,height: 40,))),
                  ],
                ),
                SizedBox(height: 55,),
              ],
            ),
          )
      ),
    );
  }

  Widget? getScreen(){
    switch (currentItem){
    // case MenuItems.clients:
    // return Payment();
      case MenuItems.instructions:
        return Payment();
      case MenuItems.booking:
        return Payment();
      case MenuItems.call:
        return CallService();
      case MenuItems.faq:
        return Payment();
      case MenuItems.home:
        return Directionality(textDirection:TextDirection.ltr,child:  ChangeNotifierProvider(
            create: (_) => currentUserProvider(),
            child: LogInScreen()
        ),);
    }
  }
}


class MenuItems{

  static const MenuItem instructions = MenuItem( "הנחיות",  "assets/instruction.png");
  //static const MenuItem clients = MenuItem( "לקוחות מספרים",  "assets/clients.png");
  static const MenuItem faq = MenuItem( "שאלות ותשובות",  "assets/faq.png");
  static const MenuItem call = MenuItem("יצירת קשר",  "assets/call.png");
  static const MenuItem booking = MenuItem("Booking", "assets/booking.png");
  static const MenuItem home = MenuItem("דף הבית", "assets/home.png");

  static List<MenuItem> MenuItemList = [
    home,instructions,faq,call,booking
  ];

}

class MenuItem{
  final String name;
  final String ImagePath;
  const MenuItem(this.name, this.ImagePath);
}



