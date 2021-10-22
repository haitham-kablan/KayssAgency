

import 'package:app/Car/CarSure.dart';
import 'package:app/Design/Animation/Animation.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/Design/Widgets/Button.dart';
import 'package:app/Design/Widgets/SemiAppBar.dart';
import 'package:app/Home/HomePage.dart';
import 'package:app/HomeScreen/HomeScreen.dart';
import 'package:app/HomeScreen/NefeshScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'nefesh.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int index=0;
  List<Widget> screens = [
    NefeshScreen(),
    NefeshScreen(),
    CarSure(),
    NefeshScreen(),
    HomeScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    int provIndex = Provider.of<toggleProvider>(context)._index;
    bool toggle = true;

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: provIndex == 4 ? Colors.transparent : darkBlueClr,
          ),
          child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (nindex){
              print(nindex);
              Provider.of<toggleProvider>(context,listen: false).setToggle(nindex);
              setState(() {
                index = nindex;
              });
            },
            destinations: [
              NavigationDestination(icon: Icon(Icons.airplanemode_on_sharp), label: ("חבילת נפש"),
                  selectedIcon: Icon(Icons.airplanemode_on_sharp,color: provIndex == 4 ? darkBlueClr : Color(0xffECEEF3))),
              NavigationDestination(icon: Icon(Icons.accessibility_new_sharp), label: "ביטוח חיים",selectedIcon: Icon(Icons.accessibility_new_sharp,color: provIndex == 4 ? darkBlueClr :Color(0xffECEEF3),)),
              NavigationDestination(icon: Icon(Icons.car_rental), label: "ביטוח רכב",selectedIcon: Icon(Icons.car_rental,color: provIndex == 4 ? darkBlueClr :Color(0xffECEEF3),)),
              NavigationDestination(icon: Icon(Icons.shopping_cart_rounded), label: "רכישת מוצרים",selectedIcon: Icon(Icons.shopping_cart_rounded,color: provIndex == 4 ? darkBlueClr :Color(0xffECEEF3),)),
            ],

          ),
        ),
        //extendBodyBehindAppBar: true,
        backgroundColor: darkBlueClr,
        body: screens[provIndex],
    
      ),
    );
  }
}


class toggleProvider extends ChangeNotifier{
  int _index = 4;

  int get toggle => _index;

  void setToggle(int index){
    _index = index;
    notifyListeners();
  }






}
