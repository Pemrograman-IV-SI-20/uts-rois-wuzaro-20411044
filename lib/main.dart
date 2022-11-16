 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/routes.dart';
import 'package:toko_gitar_flutter/screens/Login/LoginScreens.dart';
import 'package:toko_gitar_flutter/theme.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Toko Gitar Keren",
      theme: theme(),
      initialRoute: LoginScreens.routeName,
      routes: routes,
    ));
  
}
