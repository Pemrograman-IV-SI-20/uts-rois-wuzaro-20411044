

import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Screens/Login/LoginScreens.dart';
import 'package:toko_gitar_flutter/Screens/Register/RegisterScreens.dart';
import 'package:toko_gitar_flutter/screens/Users/HomeUsersScreens.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),


  //Halaman user
  HomeUserSreens.routeName: (context) => HomeUserSreens(),
};