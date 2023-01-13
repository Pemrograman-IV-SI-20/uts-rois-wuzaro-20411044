import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/API/ConfigUrl.dart';
import 'package:toko_gitar_flutter/Components/custom_surfix_icon.dart';
import 'package:toko_gitar_flutter/Components/default_button_custome_color.dart';
import 'package:toko_gitar_flutter/Screens/Login/LoginScreens.dart';
import 'package:toko_gitar_flutter/size_config.dart';
import 'package:toko_gitar_flutter/utils/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SignUpform extends StatefulWidget {
  @override 
  _SignUpform createState() => _SignUpform();
}

class _SignUpform extends State<SignUpform> {

  final _formKey = GlobalKey<FormState>();
  String? namalengkap;
  String? username;
  String? email;
  String? password;
  bool? remeber = false;

  Response? response;
  var dio = Dio();

  TextEditingController txtNamaLengkap = TextEditingController(),
                        txtUserName = TextEditingController(),
                        txtEmail = TextEditingController(),
                        txtPassword= TextEditingController();

  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildNamaLengkap(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildUserName(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmail(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          
            DefaultButtonCustomeColor(
              color: kSecondaryColor,
              text: "Register",
              press: () {
                prosesRegistrasi(txtUserName.text, txtPassword.text, txtNamaLengkap.text, txtEmail.text);
              },
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: Text("Sudah Punya Akun? Masuk Disini", 
                style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
        ],
        ),
      );
  }
  TextFormField buildNamaLengkap() {
    return TextFormField(
      controller: txtNamaLengkap,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Nama Lengkap',
        hintText: 'Masukan Nama Lengkap',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/User.svg",
      )),
      );
  }

  TextFormField buildUserName() {
    return TextFormField(
      controller: txtUserName,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Masukan Username',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/account.svg",
      )),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      controller: txtEmail,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Masukan Email',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Mail.svg",
      )),
      );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Masukan Password',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Lock.svg",
      )),
      );
  }

  void prosesRegistrasi(username, password, nama, email) async{
    utilsApps.showDialog(context);
bool status; 
var msg;
var dataUserlogin;
try{
response = await dio.post(registrasiUrl, data: {
      'username': username,
      'password': password,
      'nama': nama,
      'email': email
    });
    status = response!.data['sukses'];
    msg = response!.data['msg'];
    
setState(() {
  if (status){
      utilsApps.hideDialog(context);
AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.RIGHSLIDE,
            title: 'PERINGATAN !!!',
            desc: 'Berhasil Registrasi.............',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
              print(dataUserlogin);
             // Navigator.pushNamed(context,LoginScreen.routeName);
            },
            )..show();
    }

  else{
    utilsApps.hideDialog(context);
    AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            title: 'PERINGATAN !!!',
            desc: 'Gagal Registrasi $msg',
            btnOkOnPress: () {},
            btnOkColor: kColorRedSlow
            )..show();
  }
});

}catch(e){
  setState(() {
    utilsApps.hideDialog(context);
  });
  AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            title: 'PERINGATAN !!!',
            desc: 'Gagal Registrasi.............',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            )..show();
}

    
    print(response!.data['msg']);
  }
}