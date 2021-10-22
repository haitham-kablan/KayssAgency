

import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CityData{

  final String name;
  final String image;
  final List<String> keyWords;

  CityData(this.name, this.image, this.keyWords);
}

class CityDisplay extends StatelessWidget {

  final String name;
  final String image;
  final List<String> keywords;
  const CityDisplay({Key? key, required this.name, required this.image, required this.keywords}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            height: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),fit: BoxFit.fill
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          name,style: GoogleFonts.architectsDaughter(color: Colors.white,fontSize: 35),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),

          ),
        ],
      ),
    );
  }
}
