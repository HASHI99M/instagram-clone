import 'package:flutter/material.dart';
import 'package:instagram/provider/auth.dart';
import 'package:instagram/size_config.dart';
import 'package:instagram/ultimate/helpers.dart';
import 'package:instagram/views/auth_system/register_input_code_screen/register_input_code_screen.dart';
import 'file:///C:/Users/HASHIM/AndroidStudioProjects/instagram/lib/views/components/custom_button_login.dart';
import 'package:instagram/views/auth_system/register_screen/components/textfield_register.dart';
import 'package:provider/provider.dart';

import 'image_profile.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double defaultSize = SizeConfig.defaultSize , defaultSize2 = SizeConfig.defaultSize2;
  bool isPhone = true;
  bool disableBtnPhone = true;
  bool disableBtnEmail = true;
  bool validEmail = false;
  TextEditingController emailController, phoneController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: defaultSize2*8,),
            Center(child: ImageProfile()),
            SizedBox(
              height: defaultSize2,
            ),
            switchTab(),
            SizedBox(
              height: defaultSize2,
            ),
            isPhone ? contentPhone() : contentEmail()
          ],
        ),
      ),
    );
  }

  Widget switchTab() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isPhone = true;
                });
              },
              child: Container(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:  defaultSize2*.8),
                    child: Text(getTranslated(context, 'phone'),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: isPhone ? Colors.black : Colors.grey)),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: .9,
                        color: isPhone ? Colors.black : Colors.grey,
                      ))
                ],
              )),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isPhone = false;
                });
              },
              child: Container(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultSize2*.8),
                    child: Text(getTranslated(context, 'email'),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: isPhone ? Colors.grey : Colors.black)),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: isPhone ? Colors.grey : Colors.black,
                        height: .9,
                      ))
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget contentEmail() {
    return Column(
      children: [
        TextFieldRegister(
          error: validEmail,
          errorMsg: getTranslated(context, 'email_valid'),
          hint: getTranslated(context, 'email'),
          controller: emailController,
          textInputType: TextInputType.text,
          onClick: () {
            emailController.clear();
            setState(() {
              disableBtnEmail = true;
              validEmail = false;
            });
          },
          onChange: (value) {
            setState(() {
              if (value.toString().isNotEmpty) {
                disableBtnEmail = false;
              } else {
                disableBtnEmail = true;
                validEmail = false;
              }
            });
          },
        ),
        SizedBox(
          height: defaultSize2,
        ),
        CustomButtonLogin(
          text: getTranslated(context, 'next'),
          onClick: _clickEmail,
          disable: disableBtnEmail,
        )
      ],
    );
  }

  Widget contentPhone() {
    return Column(
      children: [
        TextFieldRegister(
          hint: getTranslated(context, 'phone'),
          controller: phoneController,
          textInputType: TextInputType.phone,
          onClick: () {
            phoneController.clear();
            setState(() {
              disableBtnPhone = true;
            });
          },
          onChange: (value) {
            setState(() {
              if (value.toString().isNotEmpty) {
                disableBtnPhone = false;
              } else {
                disableBtnPhone = true;
              }
            });
          },
        ),
        SizedBox(
          height: defaultSize2*.5,
        ),
        Text(
          getTranslated(context, 'helper_txt'),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          height: defaultSize2 ,
        ),
        CustomButtonLogin(
          text: getTranslated(context, 'next'),
          onClick: _clickPhone,
          disable: disableBtnPhone,
        )
      ],
    );
  }

  void _clickEmail() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    if (emailValid) {
      Provider.of<Auth>(context , listen: false).setValues(
          email: isPhone
              ? phoneController.text.trim()
              : emailController.text.trim());
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterInputCodeScreen(),
          ));
    } else {
      setState(() {
        validEmail = !emailValid;
      });
    }
  }

  void _clickPhone() {}
}
