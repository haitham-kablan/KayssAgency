
import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/Design/Widgets/SemiAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundClr,
      appBar: SemiAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: Text("יצירת קשר",style: simpleTextStyle(50,MainTextColor),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(width: 25,),
                Column(
                  children: [
                    Text("מספר ראשון",style: simpleTextStyle(18,MainTextColor)),
                    Text("0522741815",style: simpleTextStyle(18,Colors.grey)),
                  ],
                ),
                Spacer(flex: 1,),
                IconButton(onPressed: (){}, icon: Icon(Icons.phone,color: goldClr,size: 20,)),
                SizedBox(width: 25,),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 25,),
                Column(
                  children: [
                    Text("מספר שני",style: simpleTextStyle(18,MainTextColor)),
                    Text("0505369687",style: simpleTextStyle(18,Colors.grey)),
                  ],
                ),
                Spacer(flex: 1,),
                IconButton(onPressed: (){}, icon: Icon(Icons.phone,color: goldClr,size: 20,)),
                SizedBox(width: 25,),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 25,),
                Column(
                  children: [
                    Text("משרד",style: simpleTextStyle(18,MainTextColor)),
                    Text("04-9802785",style: simpleTextStyle(18,Colors.grey)),
                  ],
                ),
                Spacer(flex: 1,),
                IconButton(onPressed: (){}, icon: Icon(Icons.phone,color: goldClr,size: 20,)),
                SizedBox(width: 25,),
              ],
            ),
            SizedBox(height: 50,),
            Text("דוא\"ל",style: simpleTextStyle(18,MainTextColor),textDirection: TextDirection.rtl,),
            Text("haitham1kablan@gmail.com",style: simpleTextStyle(18,Colors.grey)),
            IconButton(onPressed: (){},icon: Icon(Icons.email,color: goldClr,size: 25,),),
            SizedBox(height: 50,),
            Row(
              children: [
                Spacer(flex: 1,),
                Image.asset("assets/facebook.png",height: 40,width: 40,),
                SizedBox(width: 25,),
                Image.asset("assets/insta.png",height: 40,width: 40,),
                Spacer(flex: 1,),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}
