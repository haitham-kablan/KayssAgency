
import 'package:app/NavBarScreens/CarSure.dart';
import 'package:app/Contact/Contact.dart';
import 'package:app/Design/Animation/Animation.dart';
import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/Design/Widgets/FullAppBar.dart';
import 'package:app/Design/Widgets/HomePageButton.dart';
import 'package:app/Design/Widgets/SemiAppBar.dart';
import 'package:app/HomeScreen/HomeScreen.dart';
import 'package:app/Life/LiefSure.dart';
import 'package:app/Screens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'CallService.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  MenuItem currentItem = MenuItems.home;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ZoomDrawer(
      slideWidth: 190,
      mainScreen: getScreen()!,
      menuScreen: Builder(
        builder: (context) {
          return MenuPage(
            currentItem: currentItem,
            onSelectedPage: (MenuItem value) {
              setState(() {
                currentItem = value;
                ZoomDrawer.of(context)!.close();
              });

            },
          );
        }
      ),

    );
  }

  Widget? getScreen(){
    switch (currentItem){
      case MenuItems.clients:
        return Payment();
      case MenuItems.instructions:
        return Payment();
      case MenuItems.booking:
        return Payment();
      case MenuItems.call:
        return CallService();
      case MenuItems.faq:
        return Payment();
      case MenuItems.home:
        return Directionality(textDirection:TextDirection.rtl,child: Home());
    }
  }
}


class MenuPage extends StatelessWidget {

  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedPage;
  const MenuPage({Key? key, required this.currentItem, required this.onSelectedPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor:NavDrawerBgClr,
        body: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                //color: Color(0xff010715).withOpacity(0.5),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/menuBg.png",
                  ),fit: BoxFit.fill
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff010715).withOpacity(0.85),
                // image: DecorationImage(
                //   image: AssetImage(
                //     "assets/menuBg.png",
                //   ),fit: BoxFit.fill
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 1,),
                  SizedBox(height: 40,),
                  ...MenuItems.MenuItemList.map(
                          (e) => Container(
                            decoration: BoxDecoration(
                              color: e == currentItem ? Colors.white.withOpacity(0.15) : Colors.transparent,
                            ),
                            child: ListTile(
                              selected: e == currentItem,
                              leading: Image.asset(e.ImagePath,width: 20,height: 20,),
                              title: simpleTxt(e.name, 16, Colors.white),
                              minLeadingWidth: 20,
                              onTap: () => onSelectedPage(e),

                            ),
                          )
                  ).toList(),
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Image.asset("assets/facebook.png",width: 30,height: 30,),
                      SizedBox(width: 10,),
                      Image.asset("assets/insta.png",width: 30,height: 30,),
                    ],
                  ),
                  Spacer(flex: 2,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.white,),
          onPressed: (){

            ZoomDrawer.of(context)!.toggle();
          },
        ),
      ),
    );
  }
}


class MenuItems{

  static const MenuItem instructions = MenuItem( "הנחיות",  "assets/instruction.png");
  static const MenuItem clients = MenuItem( "לקוחות מספרים",  "assets/clients.png");
  static const MenuItem faq = MenuItem( "שאלות ותשובות",  "assets/faq.png");
  static const MenuItem call = MenuItem("יצירת קשר",  "assets/call.png");
  static const MenuItem booking = MenuItem("Booking", "assets/booking.png");
  static const MenuItem home = MenuItem("דף הבית", "assets/home.png");

  static List<MenuItem> MenuItemList = [
  home,instructions,clients,faq,call,booking
  ];

}

class MenuItem{
  final String name;
  final String ImagePath;
  const MenuItem(this.name, this.ImagePath);
}



