import 'package:app/Design/Animation/Animation.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/Design/Widgets/AppBarProvider.dart';
import 'package:app/HomeScreen/HomeScreen.dart';
import 'package:app/Screens/Home.dart';
import 'package:app/Screens/nefesh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NefeshScreen extends StatefulWidget {
  NefeshScreen({Key? key }) : super(key: key);

  @override
  _NefeshScreenState createState() => _NefeshScreenState();

}

class _NefeshScreenState extends State<NefeshScreen> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            backgroundColor: darkBlueClr,
            elevation: 0,
            title: Image.asset("assets/logo.png",height: 65,width: 100,),
            actions: [
              IconButton(onPressed: (){
                Provider.of<toggleProvider>(context,listen: false).setToggle(4);
              }, icon: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,),),
              SizedBox(width: 10,),
            ],
          ),
          body:
              Container(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    //SizedBox(height: 100,),
                    Material(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, CustomPageRoute(child: Nefesh()));
                        },
                        child: Stack(
                          children: [
                            Container(
                                  height: 200,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/nefeshBg/special.png"),fit: BoxFit.fill
                                    )
                                  ),

                                ),
                            Container(
                              height: 200,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.15)
                              ),

                            ),
                            Container(
                              height: 200,
                              width: size.width,
                              child: Center(
                                child: simpleTxt("חבילות מיוחדות", 40, Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Expanded(child: NefeshTab(size: size,imagePath: "assets/nefeshBg/xmas.png",onTap: (){},name: "קריסמס",)),
                          Expanded(child: NefeshTab(size: size,imagePath: "assets/nefeshBg/goal.png",onTap: (){},name: "ליגת\nהאלופות",)),

                        ],

                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child: NefeshTab(size: size,imagePath: "assets/nefeshBg/honeymoon.png",onTap: (){},name: "דבש\nירח",)),
                          Expanded(child: NefeshTab(size: size,imagePath: "assets/nefeshBg/group.png",onTap: (){},name: "טיולים\nמאורגנים",)),
                        ],

                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}


class NefeshTab extends StatefulWidget {
  final Size size;
  final String imagePath;
  final onTap;
  final String name;
  const NefeshTab({Key? key, required this.size, required this.imagePath, required this.onTap, required this.name}) : super(key: key);

  @override
  _NefeshTabState createState() => _NefeshTabState(size,imagePath,onTap,name);
}

class _NefeshTabState extends State<NefeshTab> {

  final Size size;
  final String imagePath;
  final onTap;
  final String name;

  _NefeshTabState(this.size, this.imagePath, this.onTap, this.name);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: size.width * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),fit: BoxFit.fill
                )
              ),

            ),
            Container(
              width: size.width * 0.5,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.15)
              ),

            ),
            Container(
              width: size.width * 0.5,
              child: Center(
                  child: Text(name,textAlign: TextAlign.center,style: simpleTextStyle(30, Colors.white),)
              ),

            ),
          ],
        ),
      ),
    );
  }
}

