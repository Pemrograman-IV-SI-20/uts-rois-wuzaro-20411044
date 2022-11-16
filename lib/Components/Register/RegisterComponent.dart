import 'package:flutter/cupertino.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:toko_gitar_flutter/Components/Register/RegisterForm.dart';
import 'package:toko_gitar_flutter/Utils/constanTs.dart';
import 'package:toko_gitar_flutter/size_config.dart';

class RegisterComponent  extends StatefulWidget{
 @override
 _RegisterComponent createState()=> _RegisterComponent();
}
class _RegisterComponent extends State<RegisterComponent>{
  @override
Widget build(BuildContext context){
  return SafeArea(
    child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "REGISTRASI",
                  style: TextStyle(fontSize: 30, color: kColorBlue),
                  ), 
                SizedBox(
                  height: SizeConfig.screenHeight *0.04,
                ),
                 SizedBox(
                  height: SizeConfig.screenHeight *0.04,
                ),
                SimpleShadow(
                  child :
                  Image.asset(
                    "assets/images/pencil.png",
                    height: 100,width: 202,
                    ),
                    opacity: 0.5,
                    color: kSecondaryColor,
                    offset:  Offset(5, 5),
                    sigma:  2,
                    ),
                   Padding (padding: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("REGISTRASI!",
                        style: mTitleStyle,
                        )
                      ],
                    )),
                    SizedBox(
                      height: 20,
                      ),
                      SignUpform(),
              ],
              ),
          ),
      ),
  ),
  );
}
}