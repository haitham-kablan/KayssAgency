import 'dart:math';

import 'package:app/Design/Animation/Animation.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/Widgets/Button.dart';
import 'package:app/Design/Widgets/errorMsg.dart';
import 'package:app/Design/Widgets/userImage.dart';
import 'package:app/Services/Authentication/Authentication.dart';
import 'package:app/utils/urlLauncher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Design/FontStyle/FontStyle.dart';
import 'Design/Widgets/TextFormFeild.dart';
import 'Home/CallService.dart';
import 'Home/HomePage.dart';
import 'Providers/AuthProvider.dart';
import 'Screens/Home.dart';
import 'Services/ColudFireStore/CloudFireStore.dart';
import 'Services/Storage/StorageService.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  var rnd = new Random();
  bool start = false;
  bool signiIn = false;
  double height = 100;
  double containerHeight =0;
  List<Widget> tmp = [];

  bool signInAcc = false;
  bool systemWait = true;


  bool isLoaidng = false;
  bool sisLoaidng = false;

  TextEditingController email = TextEditingController();
  TextEditingController semail = TextEditingController();
  TextEditingController pw = TextEditingController();
  TextEditingController spw = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();


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

  void updateUser(currentUserProvider provider)async{
    await AuthenticationService.getCurrentUser(provider);
    setState(() {
      systemWait = false;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    updateUser(Provider.of<currentUserProvider>(context));
    int upoints = Provider.of<currentUserProvider>(context).points;
    String uname = Provider.of<currentUserProvider>(context).name;
    String uemail = Provider.of<currentUserProvider>(context).email;
    String uphone = Provider.of<currentUserProvider>(context).phoneNumber;
    String uImage = Provider.of<currentUserProvider>(context).image;
    bool uinit = Provider.of<currentUserProvider>(context).init;



    Size size = MediaQuery.of(context).size;
    List<Widget> chil = [
      Row(
        children: [
          Spacer(flex: 1,),
          IconButton(
            onPressed: () async {
              setState(() {

                containerHeight = 0;
                tmp = [];
              });
              await Future.delayed(Duration(milliseconds: 200));
              setState(() {
                signiIn = false;
              });
            },
            icon: Icon(Icons.close,color: bgClr,),
          ),
        ],
      ),
      SizedBox(height: 20,),
      UserImage(onFileChanged: (x){}),
      SizedBox(height: 40,),
      Container(
        height: 40,
        margin: EdgeInsets.only(left: 40,right: 40),
        child: FormFeildText("דוא\"ל",bgClr,borderClr: bgClr,txtColor: Colors.white,controler: email),
      ),
      SizedBox(height: 20,),
      Container(
        height: 40,
        margin: EdgeInsets.only(left: 40,right: 40),
        child: FormFeildText("סיסמה",bgClr,borderClr: bgClr,txtColor: Colors.white,controler: pw,secure:true),
      ),
      SizedBox(height: 20,),
      Container(
        height: 40,
        margin: EdgeInsets.only(left: 40,right: 40),
        child: FormFeildText("פלפון",bgClr,borderClr: bgClr,txtColor: Colors.white,number: true,controler: phone),
      ),
      SizedBox(height: 20,),
      Container(
        height: 40,
        margin: EdgeInsets.only(left: 40,right: 40),
        child: FormFeildText("שם ושם משפחה",bgClr,borderClr: bgClr,txtColor: Colors.white,controler: name),
      ),
      SizedBox(height: 60,),
     Button(context, ()async{

          if(email.text.isEmpty || pw.text.isEmpty || name.text.isEmpty || phone.text.isEmpty){
            errorMsg(context, "נא מלא את כל השדות");
            isLoaidng = false;
            return;
          }
          if(!email.text.isValidEmail()){
            isLoaidng = false;
            errorMsg(context, "דוא\"ל לא חוקי");
            return;
          }

          setState(() {
            isLoaidng = true;
          });

          String? ans = await AuthenticationService.Reigester(email.text, pw.text, name.text);


          if(ans!=null){
            errorMsg(context, ans);
            setState(() {
              isLoaidng = false;
            });

            return;
          }


          Provider.of<currentUserProvider>(context,listen: false).setEmail(email.text);
          Provider.of<currentUserProvider>(context,listen: false).setName(name.text);
          Provider.of<currentUserProvider>(context,listen: false).setPhone(phone.text);

          if(UserImage.getImage() != null){
            String imgPath = await FireBaseStorage.uploadProfilePicture(UserImage.getImage()!.path, email.text);
            Provider.of<currentUserProvider>(context,listen: false).setImage(imgPath);
          }

          await CloudFireStore.addUserToDb(Provider.of<currentUserProvider>(context,listen: false).toMap());
          ans = await AuthenticationService.Login(email.text, pw.text);

          if(ans!=null){
            errorMsg(context, ans);
            setState(() {
              isLoaidng = false;
            });
            return;
          }

          setState(() {
            isLoaidng = false;
          });

          setState(() {
            tmp = [];
            containerHeight = 0;

          });
          await Future.delayed(Duration(milliseconds: 10));
          setState(() {
            signiIn = false;
          });

          Provider.of<currentUserProvider>(context,listen: false).setInit(true);

      }, BorderRadius.circular(15), "הרשמה",size.width * 0.35,30,blueClr),
    ];

    MenuItem currentItem = MenuItems.home;

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
          return Directionality(textDirection:TextDirection.rtl,child:  ChangeNotifierProvider(
              create: (_) => currentUserProvider(),
              child: LogInScreen()
          ),);
      }
    }

    return SafeArea(
      child: Scaffold(
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
        key: _scaffoldKey,
        //endDrawerEnableOpenDragGesture: false,
        resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          backgroundColor: bgClr,
          body: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[2]),fit: BoxFit.fill
                  )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu,color: Colors.white,size: 20,),
                      onPressed: (){
                        _scaffoldKey.currentState!.openDrawer();
                        print(2);
                      },
                    ),

                    IconButton(
                      icon: Icon(Icons.call,color: Colors.white,size: 17,),
                      onPressed: (){
                       whatsLuncher(context);
                        //launchURL("tel://049802785",context);
                      },
                    ),

                    Spacer(flex: 1,),
                    Image.asset("assets/logo.png",width: 110,height: 55,),
                    SizedBox(width: 3,),

                  ],
                ),
              ),
              systemWait ? CircularProgressIndicator(color: blueClr,):(uinit == false?(signiIn == false ? Align(
                alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        signInAcc == false? Container(
                          margin: EdgeInsets.only(top: 40),
                          height: 110,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: darkBlueClr.withOpacity(0.7),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //   SizedBox(height: 45,),
                              RichText(text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text:"עדיין אין לך משתמש?",style: simpleTextStyle(17, Colors.white)),
                                    TextSpan(
                                      text:" הרשמה",style: simpleTextStyle(17, blueClr),
                                      recognizer: TapGestureRecognizer()..onTap = ()async{ setState(() {
                                        signiIn=true;
                                        containerHeight = size.height * 0.7;
                                      });
                                      await Future.delayed(Duration(milliseconds: 200));
                                      setState(() {
                                        tmp = chil;
                                      });

                                      },),
                                  ]
                              )),
                              // Spacer(flex: 1,),
                              SizedBox(height: 10,),
                              Button(context, (){
                                    setState(() {
                                      signInAcc = true;
                                    });
                              }, BorderRadius.circular(15), "כניסה",size.width * 0.35,30,blueClr),
                              SizedBox(height: 25,),
                              //
                            ],
                          ),) : Directionality(
                          textDirection: TextDirection.rtl,
                            child: Container(
                            height: 300,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: darkBlueClr.withOpacity(0.7),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Spacer(flex: 1,),
                                    IconButton(onPressed: (){
                                      setState(() {
                                        signInAcc = false;
                                      });
                                    }, icon: Icon(Icons.close,color: Colors.white,))
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(left: 40,right: 40),
                                  child: FormFeildText("דוא\"ל",bgClr,borderClr: bgClr,txtColor: Colors.white,controler: semail),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(left: 40,right: 40),
                                  child: FormFeildText("סיסמה",bgClr,borderClr: bgClr,txtColor: Colors.white,controler: spw,secure: true),
                                ),
                                SizedBox(height: 40,),
                                sisLoaidng ? CircularProgressIndicator(color: blueClr,):Button(context, ()async{
                                    if(semail.text.isEmpty || spw.text.isEmpty){
                                      errorMsg(context, "נא מלא את כל השדות");
                                      return;
                                    }
                                    if(!semail.text.isValidEmail()){
                                      errorMsg(context, "דו\"אל לא נכון");
                                      return;
                                    }

                                    setState(() {
                                      sisLoaidng = true;
                                    });

                                    String? ans = await AuthenticationService.Login(semail.text, spw.text);

                                    if(ans!=null){
                                      setState(() {
                                        sisLoaidng = false;
                                        errorMsg(context, ans);
                                        return;
                                      });
                                    }

                                    Map<String,dynamic> map = Map();
                                    await CloudFireStore.getUser(Provider.of<currentUserProvider>(context,listen: false),semail.text);
                                    print(map);
                                    setState(() {
                                      sisLoaidng = false;
                                      signInAcc = false;
                                    });
                                }, BorderRadius.circular(15), "כניסה",size.width * 0.35,30,blueClr),

                              ],
                            ),
                        ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          ],
                        )
                      ],
                    ),
                  ):Container()):Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      height: 110,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: darkBlueClr.withOpacity(0.7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //   SizedBox(height: 45,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              simpleTxt(","+uname, 15, Colors.white),
                              RichText(text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text:"שלום לך ",style: simpleTextStyle(15, Colors.white)),
                                  ]
                              )),
                              SizedBox(width: 25,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RichText(
                                  textDirection: TextDirection.rtl,
                                  text: TextSpan(
                                  children: [

                                    TextSpan(
                                        text:"סה\"כ נקודות צברו:   ",style: simpleTextStyle(15, Colors.white)),
                                    TextSpan(
                                      text:upoints.toString()+" נקודות",style: simpleTextStyle(15, blueClr),),
                                  ]
                              )),
                              SizedBox(width: 25,),
                            ],
                          ),
                          SizedBox(height: 35,),
                          //
                        ],
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 25,),
                      Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){
                          //selectPhoto();
                        },
                        child: uImage == ""? Container(
                          // margin: EdgeInsets.only(right: 5),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: bgClr,
                            border: Border.all(width: 1,color:darkBlueClr ),
                          ),
                          child: Icon(Icons.account_circle_outlined , color: darkBlueClr))
                            :UserImage(onFileChanged: (String imageUrl) async{
                          if(UserImage.getImage() == null){
                            return;
                          }else{
                            String path = await FireBaseStorage.uploadProfilePicture(UserImage.getImage()!.path, uemail);
                            Map<String,dynamic> map = Map();
                            map["image"] = path;
                            await CloudFireStore.updateUserFeild(map, uemail);
                          }

                        },),
                      ),
                    ),
                      ],
                    )
                  ],
                ),
              )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      child: AnimatedContainer(
                        height: containerHeight, duration: Duration(milliseconds: 200),
                        width: size.width,
                        color: darkBlueClr.withOpacity(0.7),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: isLoaidng ? [
                              Center(child: CircularProgressIndicator(color: blueClr,)),
                            simpleTxt("נא המתן", 15, Colors.white),

                            ] : tmp,
                          ),
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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

