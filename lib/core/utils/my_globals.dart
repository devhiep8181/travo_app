import 'package:flutter/material.dart';

//MyGlobals myGlobals = MyGlobals();

class MyGlobals {

  factory MyGlobals() {
    return _instance;
  }
  MyGlobals._internal();

  static final MyGlobals _instance = MyGlobals._internal();

  final GlobalKey _scaffoldKey = GlobalKey();
  
  GlobalKey get scaffoldKey => _scaffoldKey;
}
