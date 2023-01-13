import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/size_config.dart';

class HomeUserSreens extends StatelessWidget {
 static var routeName = '/home_user_screens';
var dataUserlogin;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(child: Text("selamat datang di aplikasi keren"))
      
    );
  }
}