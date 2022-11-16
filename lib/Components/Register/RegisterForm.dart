import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:toko_gitar_flutter/Components/Register/Registrasi.dart';
import 'package:toko_gitar_flutter/Components/custom_surfix_icon.dart';
import 'package:toko_gitar_flutter/Components/default_button_custome_color.dart';
import 'package:toko_gitar_flutter/Screens/Register/RegisterScreens.dart';
import 'package:toko_gitar_flutter/Utils/constants.dart';
import 'package:toko_gitar_flutter/size_config.dart';

class SignInform extends StatefulWidget{
@override
 _SignInform createState() => _SignInform();
}
  @override 
  class _SignInform extends State<SignInform>{

    final _formkey = GlobalKey<FormState>();
    String?  username;
    String? Password;
    bool? remeber =false;

    TextEditingController txtUsserName = TextEditingController(),
    txtPassword = TextEditingController();

    FocusNode focusNode = FocusNode();
  
  Widget build (BuildContext context){
    return Form(
      child: Column(
        children: [
        buildUserName(),
        SizedBox(height: getProportionateScreenHeight(30)),
         buildPassword(),
        SizedBox(height: getProportionateScreenHeight(30)),
        Row(
          children: [ 
            Checkbox(
            value: remeber, 
            onChanged: (value){
              setState(() {
                remeber = value;
              });
            }),
            Text("Tetap Masuk"),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Lupa Password",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
        DefaultButtonCustomeColor(
          color: kPrimaryColor,
          text: "Masuk",
          press: (){},
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
              onTap: () {
              Navigator.pushNamed(context, RegisterScreen.routeName);
              },
              child: Text(
                "Belum Punya Akun ? Daftar Disini",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
        )
      ],
      ),
    );
  }
    TextFormField buildUserName(){
    return TextFormField(
      controller: txtUsserName,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
         labelText: 'UserName',
         hintText: 'Masukkan Ussername Anda',
         labelStyle: TextStyle(
          color:focusNode.hasFocus ? mSubtitleColor: kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:CustomSurffixIcon
        (svgIcon: "assets/icons/User.svg")),
          );
  }
   TextFormField buildPassword(){
    return TextFormField(
      controller: txtPassword,
      obscureText: true ,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
         labelText: 'Password',
         hintText: 'Masukkan Password Anda',
         labelStyle: TextStyle(
          color:focusNode.hasFocus ? mSubtitleColor: kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:CustomSurffixIcon(
        svgIcon: "assets/icons/Lock.svg",
        )),
        );
  }
}