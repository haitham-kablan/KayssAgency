import 'package:app/Home/HomePage.dart';
import 'package:app/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  ChangeNotifierProvider(
        create: (_) => toggleProvider(),
          child: HomePage()
      ),

    );
  }
}
