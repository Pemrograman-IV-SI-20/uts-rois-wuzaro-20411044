import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/components/custom_surfix_icon.dart';
import 'package:toko_gitar_flutter/components/default_button_custome_color.dart';
import 'package:toko_gitar_flutter/size_config.dart';
import 'package:toko_gitar_flutter/utils/constants.dart';

class SignInform extends StatefulWidget {
@override
_SignInform createState() => _SignInform();
}
class _SignInform extends State<SignInform> {
  final _formkey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool?  remeber = false;

  TextEditingController txtUsername = TextEditingController(),
                        txtPassword = TextEditingController();

  FocusNode focusNode = new FocusNode();
 
@override
Widget build(BuildContext context) {
  return Form(child: Column(
    children: [
      BuildUserName(),
      SizedBox(height: getProportionateScreenHeight(30)),
      builPassword(),
      SizedBox(height: getProportionateScreenHeight(30)),
      Row(
        children: [
          Checkbox(value: remeber,
           onChanged: (value) {
            setState(() {
            remeber = value;
          });
        }),
          Text("Tetap Masuk"),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Text("Lupa Password", 
            style: TextStyle(decoration: TextDecoration.underline),
          ),
            )
        ],
      ),
      DefaultButtonCustomeColor(
        color: kPrimaryColor,
        text: "Masuk",
        press: (){}
        
        
        ),
SizedBox(height: 20,),
 GestureDetector(
            onTap: () {},
            child: Text("Belom Punya Akun ? Daftar Di Sini", 
            style: TextStyle(decoration: TextDecoration.underline),
            ),
            )
    ],
   ),
  );

}

TextFormField BuildUserName() {
  return TextFormField(
    controller: txtUsername,
    keyboardType: TextInputType.text,
    style: mTitleStyle,
    decoration: InputDecoration(
     labelText: 'Username',
     hintText: 'Masukan Username Anda',
     labelStyle: TextStyle(
      color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    suffixIcon: CustomSurffixIcon(
      svgIcon: "assets/icons/User.svg",
      )),
     ); 
    }
TextFormField builPassword() {
  return TextFormField(
    controller: txtPassword,
    obscureText: true,
    style: mTitleStyle,
    decoration: InputDecoration(
     labelText: 'Password',
     hintText: 'Masukan Password Anda',
     labelStyle: TextStyle(
      color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
     floatingLabelBehavior: FloatingLabelBehavior.always,
    suffixIcon: CustomSurffixIcon(
      svgIcon: "assets/icons/User.svg",
      )),
     ); 
    
  
}
}
