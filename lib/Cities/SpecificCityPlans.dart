

import 'package:app/Classes/Hotel.dart';
import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/Design/Widgets/CheckBoxes.dart';
import 'package:app/Hotel/hotels.dart';
import 'package:flutter/material.dart';

class SpecificCityPlans extends StatefulWidget {

  final String name;
  final String intoImage;
  const SpecificCityPlans({Key? key, required this.name, required this.intoImage}) : super(key: key);

  @override
  _SpecificCityPlansState createState() => _SpecificCityPlansState(name,intoImage);
}

class _SpecificCityPlansState extends State<SpecificCityPlans> {

  final String name;
  final String intoImage;

  List<bool> months = [false,false,false,false,false,false,false,false,false,false,false,false];
  List<bool> days = [false,false,false,false,false,false];

  void update(int index,List<bool> list){

      for(int i =0;i<list.length;i++){
        if(i == index){
          list[i] = true;
        }else{
          list[i] = false;
        }
      }



  }

  _SpecificCityPlansState(this.name, this.intoImage);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: darkBlueClr,

          title: simpleTxt(name, 22, Colors.white),
          centerTitle: true,
        ),
      ),
      backgroundColor: Colors.black,
      body:
          Container(
            child: Expanded(
              child: ListView(
                children: germanyHotels.map((e) => HotelListTile(hotel: e,size: size,)).toList(),
              ),
            ),
          ),

    );
  }
}

class HotelListTile extends StatefulWidget {
  final Hotel hotel;
  final Size size;
  const HotelListTile({Key? key, required this.hotel, required this.size}) : super(key: key);

  @override
  _HotelListTileState createState() => _HotelListTileState(hotel,size);
}

class _HotelListTileState extends State<HotelListTile> {
  final Hotel hotel;
  final Size size;

  _HotelListTileState(this.hotel, this.size);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 150,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(hotel.picture),fit:BoxFit.fill
              )
            ),
          ),
          Container(
            width: size.width,
            height: 200,
            color: darkBlueClr.withOpacity(0.4),
          ),
        ],
      ),

    );
  }
}

