

import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Screens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarProvider extends StatelessWidget {
  const AppBarProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return   Container(
      color: darkBlueClr,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.asset("assets/logo.png",height: 50,width: 100,),
            Spacer(flex: 1,),
            IconButton(onPressed: (){
              Provider.of<toggleProvider>(context,listen: false).setToggle(4);
            }, icon: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,),),
          ],
        ),
      ),
    );
  }
}
