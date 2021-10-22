
import 'package:app/Design/ColorsPallete/ColorsPallete.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePageButton extends StatelessWidget {
  final Size size;
  final String imagePath;
  final String txt;
  final onTap;
  const HomePageButton({Key? key, required this.size, required this.imagePath, required this.txt,this.onTap = null}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
     // borderRadius: BorderRadius.circular(15),
      child: InkWell(
        splashColor: Colors.white,
        onTap: onTap,
        child: Container(
          width: size.width * 0.4,
          child: Column(
            children: [
              Container(
                  width: size.width * 0.4,
                height: 45,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey , width : 0.2),
                    left: BorderSide(color: Colors.grey , width : 0.2),
                    right: BorderSide(color: Colors.grey , width : 0.2),
                  )
                ),
                  child:
                  Center(
                    child: txt == "חבילות נפש" ?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TilePhotoText(txt),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star,color: goldClr,size: 15,),
                            Icon(Icons.star,color: goldClr,size: 15,),
                            Icon(Icons.star,color: goldClr,size: 15,),
                            Icon(Icons.star,color: goldClr,size: 15,),
                            Icon(Icons.star,color: goldClr,size: 15,),
                          ],
                        ),
                      ],
                    ):
                    TilePhotoText(txt),
                  ),
              ),
              Container(
               width:  size.width * 0.4,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                 // border: Border.all(color: Colors.grey,width: 0.2),
                  image: DecorationImage(
                    image: AssetImage(
                      imagePath,
                    ),
                    fit: BoxFit.fill
                  ),
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}




