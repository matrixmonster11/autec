import 'package:autec/models/login_request_model.dart';
import 'package:autec/services/api_service.dart';
import 'package:autec/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:get/get.dart';

import '../../clientt.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgGreyColor,
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          key: UniqueKey(),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColor.greyShadowColor,
                  blurRadius: 0.2,
                  offset: Offset(0.0, 0.2),
                  // spreadRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/Satisfactoria_logo_v4.png'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 30,
              top: 80,
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
            const Icon(Icons.person_outline, color: Colors.black45),
            "email",
            "email".tr,
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "msgemail".tr;
              }
              return null;
            },
            (onSavedVal) {
              email = onSavedVal;
            },
            prefixIconColor: Colors.white,
            borderFocusColor: AppColor.pinkColor,
            borderColor: AppColor.greyShadowColor,
            textColor: Colors.black87,
            hintColor: Colors.black87,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.lock_outline, color: Colors.black45),
              "password",
              "pass".tr,
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "msgpass".tr;
                }
                return null;
              },
              (onSavedVal) {
                password = onSavedVal;
              },
              borderFocusColor: AppColor.pinkColor,
              borderColor: AppColor.greyShadowColor,
              textColor: Colors.black,
              hintColor: Colors.black,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.black87.withOpacity(0.7),
                icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black12),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 20),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14.0,
                  ),
                  // children: <TextSpan>[
                  //   TextSpan(
                  //     text: "Mot de passe oublié ?",
                  //     style: TextStyle(
                  //       color: Colors.black87,
                  //       decoration: TextDecoration.underline,
                  //     ),
                  //     // recognizer: TapGestureRecognizer()
                  //     // ..onTap = (){},
                  //   ),
                  // ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: FormHelper.submitButton(
              "login".tr,
              () {
                if (validateAndSave()) {
                  setState(() {
                    isAPIcallProcess = true;
                  });
                  LoginRequestModel model =
                      LoginRequestModel(email: email!, password: password!);
                  APIService.login(model).then((response) {
                    setState(() {
                      isAPIcallProcess = false;
                    });
                    if (response) {
                      Get.to(Clientt());
                    } else {
                      Get.snackbar("errcon".tr,
                          "msgerrcon".tr,
                          backgroundColor: Colors.orange,
                          colorText: Colors.white,
                          icon: Icon(Icons.error_outline, color: Colors.white),
                          snackPosition: SnackPosition.BOTTOM,
                          duration: Duration(seconds: 3),
                          borderRadius: 0);
                      return;
                    }
                  });
                }
              },
              btnColor: Colors.orange,
              borderColor: Colors.white24,
              txtColor: Colors.white,
              borderRadius: 32.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "footer".tr,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
