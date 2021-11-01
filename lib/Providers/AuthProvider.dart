

import 'package:flutter/cupertino.dart';

class currentUserProvider extends ChangeNotifier{

  int _pts = 10;
  String _email ="haitham@gmail.com";
  String _name = "hait";
  String _phoneNumber ="0545522973";
  String _image = "";

  bool _init = false;

  String get image=> _image;
  int get points => _pts;
  bool get init =>_init;
  String get email => _email;
  String get name => _name;
  String get phoneNumber => _phoneNumber;


  void setImage(String newStr){
    _image = newStr;
    notifyListeners();
  }

  void setInit(bool newIniit){
    _init = newIniit;
    notifyListeners();
  }

  void setPoints(int newPts){
    _pts = newPts;
    notifyListeners();
  }

  void setEmail(String newStr){
    _email = newStr;
    notifyListeners();
  }

  void setName(String newStr){
    _name = newStr;
    notifyListeners();
  }

  void setPhone(String newStr){
    _phoneNumber = newStr;
    notifyListeners();
  }

  Map<String,dynamic> toMap(){

    Map<String,dynamic> map = Map();
    map["pts"] = _pts;
    map["email"] = _email;
    map["phoneNumber"] = _phoneNumber;
    map["image"] = _image;
    map["name"] = _name;

    return map;

  }

}