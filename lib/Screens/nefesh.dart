
import 'package:app/Cities/SpecificCityPlans.dart';
import 'package:app/Classes/CityDisplay.dart';
import 'package:app/Classes/Hotel.dart';
import 'package:app/Design/Animation/Animation.dart';
import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/GlobalLists/Cities.dart';
import 'package:app/Hotel/HotelPayment.dart';
import 'package:app/Hotel/hotels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class Nefesh extends StatefulWidget {
  const Nefesh({Key? key}) : super(key: key);

  @override
  _NefeshState createState() => _NefeshState();
}

class _NefeshState extends State<Nefesh> {

  String qeury = "";
  int dayCounter =3;
  int monthCounter = 0;
  List<CityData> list = [];
  List<int> days = [3,4,5,6,7];
  List<String> months = ["יונואר","פברואר","מרץ","אפריל","מאי","יוני","יולי","אוגסט","ספטמבר","אוקטובור","נוומבר","דצמבר"];

  void searchCity(String newQry){


    final citis = GlobalCitiesData.where(
            (element) => element.keyWords.any(
                    (element) => element.startsWith(newQry.toLowerCase()) || newQry.toLowerCase().startsWith(element))).toList();
    setState(() {
      qeury = newQry;
      if(newQry.isEmpty){
        list = [];
      }else{
        list = citis;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          title: simpleTxt("חבילות מיוחדות", 20, Colors.white),
          backgroundColor: darkBlueClr,
          centerTitle: true,
        ),
        backgroundColor: Color(0xffECEEF3),
        body: Column(
                  children: [
                    Container(
                      width: size.width,
                      color: darkBlueClr,
                      child: Column(
                        children: [
                          SearchWidget(text: qeury, onChanged: searchCity, hintText: "מדינה"),
                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  simpleTxt("מספר לילות", 14, Colors.white),
                                  Row(
                                    children: [
                                      IconButton(onPressed: (){
                                        setState(() {
                                          monthCounter = monthCounter == 11 ? 0 : monthCounter+1;
                                        });
                                      }, icon: Icon(Icons.arrow_drop_up,color: Colors.white,size: 12,)),
                                      simpleTxt(months[monthCounter], 14, Colors.white),
                                      IconButton(onPressed: (){
                                        setState(() {
                                          monthCounter = monthCounter == 0 ? 11 : monthCounter-1;
                                        });
                                      }, icon: Icon(Icons.arrow_drop_down,color: Colors.white,size: 12)),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  simpleTxt("חודש", 14, Colors.white),
                                  Row(
                                    children: [
                                      IconButton(onPressed: (){
                                        setState(() {
                                          dayCounter = dayCounter == 4 ? 0 : dayCounter+1;
                                        });
                                      }, icon: Icon(Icons.arrow_drop_up,color: Colors.white,size: 12,)),
                                      simpleTxt(days[dayCounter].toString(), 14, Colors.white),
                                      IconButton(onPressed: (){
                                        setState(() {
                                          dayCounter = dayCounter == 0 ? 4 : dayCounter-1;
                                        });
                                      }, icon: Icon(Icons.arrow_drop_down,color: Colors.white,size: 12)),
                                    ],
                                  )
                                ],
                              ),
                            ]
                          ),
                          list.isEmpty ? Container(): Container(
                            height: list.length == 1 ? 80 : (list.length == 2 ? 140 : 200),
                            child: Scrollbar(
                              child: ListView(
                                children: list.map((e) => Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border:Border(
                                          bottom: BorderSide(color:Colors.grey,width:0.1)
                                        )
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(

                                          title: simpleTxt(e.name, 18, Colors.white),
                                          leading: Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(e.image),fit: BoxFit.fill,
                                              ),
                                              shape: BoxShape.circle
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                ).toList(),
                              ),
                            ),
                          ),
                          qeury.isNotEmpty && list.isEmpty ? Container(
                            width: size.width,
                            height: 70,
                            child: Center(
                              child: simpleTxt("אין תוצאות מתאימות", 20, Colors.white),
                            ),
                          ):Container(),
                        ],
                      ),
                    ),
                   // SizedBox(height: 20,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: germanyHotels.map((e) => Container(
                            //margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1,color: darkBlueClr),
                              )
                            ),
                            width: size.width,
                           // height: 200,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 150,height: 160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      image: DecorationImage(
                                        image: AssetImage(e.picture),fit: BoxFit.fill
                                      )
                                    ),
                                  ),
                                ),
                                HotelState(e:e),

                              ],
                            ),
                          )).toList(),

                        ),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}


class HotelState extends StatefulWidget {
  final Hotel e;
  const HotelState({Key? key, required this.e}) : super(key: key);

  @override
  _HotelStateState createState() => _HotelStateState(e);
}

class _HotelStateState extends State<HotelState> {
  int counter = 0;
  final Hotel e;

  _HotelStateState(this.e);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
        Navigator.push(context, CustomPageRoute(child: HotelPayment()));
        },
        child: Container(
          margin: EdgeInsets.only(left: 160,top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              simpleTxt("15/5/2021 - 20/5/2021", 12, darkBlueClr),
              Text(e.name , style: GoogleFonts.mPlus1p(
                color: darkBlueClr,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),),
              Row(
                children: [
                  Icon(Icons.star,color: goldClr,size: 14,),
                  Icon(Icons.star,color: goldClr,size: 14,),
                  Icon(Icons.star,color: goldClr,size: 14,),
                  Icon(Icons.star,color: goldClr,size: 14,),
                  Icon(Icons.star,color: goldClr,size: 14,),
                ],
              ),
              Row(
                children: [
                  Spacer(flex: 1,),
                  simpleTxt("מחיר לזוג", 13, darkBlueClr),
                  SizedBox(width: 15,),
                ],
              ),
              Row(
                children: [
                  Spacer(flex: 1,),

                  Text("ש\"ח" , style: GoogleFonts.mPlus1p(
                      color: darkBlueClr,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 5,),

                  Text(e.price.toString() , style: GoogleFonts.mPlus1p(
                      color: darkBlueClr,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                  simpleTxt("רק ב ", 12, darkBlueClr),

                  SizedBox(width: 15,),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      counter++;
                    });
                  }, icon: Icon(Icons.arrow_drop_up,color: darkBlueClr,size: 12,)),
                  simpleTxt(counter.toString(), 14, darkBlueClr),
                  IconButton(onPressed: (){
                    setState(() {
                      if(counter == 0){
                        return;
                      }
                      counter--;
                    });
                  }, icon: Icon(Icons.arrow_drop_down,color: darkBlueClr,size: 12)),
                  Spacer(flex: 1,),
                  simpleTxt(":מספר ילדים", 12, darkBlueClr),
                  SizedBox(width: 15,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 42,
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Colors.black26),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: style.color),
            suffixIcon: widget.text.isNotEmpty
                ? GestureDetector(
              child: Icon(Icons.close, color: style.color),
              onTap: () {
                controller.clear();
                widget.onChanged('');
                FocusScope.of(context).requestFocus(FocusNode());
              },
            )
                : null,
            hintText: widget.hintText,
            hintStyle: style,
            border: InputBorder.none,
          ),
          style: style,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}