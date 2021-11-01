import 'package:app/Design/Animation/Animation.dart';
import 'package:app/Home/HomePage.dart';
import 'package:app/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late VideoPlayerController controller;

  @override
  void initState(){
    super.initState();
    controller = VideoPlayerController.asset("assets/splash/vide_bg.mp4")..addListener(() {
      setState(() {

      });
    })..setLooping(true)..initialize().then((value)async{
      await controller.play().then((value) => _navigateToHome());
    });
 //   _navigateToHome();

  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  _navigateToHome()async{
    await Future.delayed(Duration(milliseconds: 5200),(){});
    Navigator.pushReplacement(context, CustomPageRoute(child:  ChangeNotifierProvider(
        create: (_) => toggleProvider(),
        child: Home()
    ),));
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller: controller,);
  }
}

class VideoPlayerWidget extends StatelessWidget {

  const VideoPlayerWidget({Key? key, required this.controller}) : super(key: key);
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (controller != null && controller.value.isInitialized) ?

      VideoPlayer(controller) :  Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/splash/splash_bg.png"),fit: BoxFit.fill
          )
      ),
    );
  }
}


