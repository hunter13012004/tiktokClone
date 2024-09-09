import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/const/constStyle.dart';
import 'package:tiktok_clone/controllers/Auth_Controller.dart';
import 'package:tiktok_clone/widgets/AuthButton.dart';
import 'package:tiktok_clone/widgets/AuthFeilds.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    var authcontroller = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/tiktok.png',
                  height: 100.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'TIKTOK',
                  style: headingStyle,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Authfeilds(
                    controller: authcontroller.namecontroller,
                    hinttext: 'Name',
                    obscure: false),
                SizedBox(
                  height: 20.h,
                ),
                Authfeilds(
                    controller: authcontroller.usernamecontroller,
                    hinttext: 'Username',
                    obscure: false),
                SizedBox(
                  height: 20.h,
                ),
                Authfeilds(
                  controller: authcontroller.emailcontroller,
                  obscure: false,
                  hinttext: 'Email',
                ),
                SizedBox(
                  height: 20.h,
                ),
                Authfeilds(
                    controller: authcontroller.passwordcontroller,
                    hinttext: 'Password',
                    obscure: true),
                SizedBox(
                  height: 20.h,
                ),
                Authfeilds(
                    controller: authcontroller.Confirmpasswordcontroller,
                    hinttext: 'Confirm Password',
                    obscure: true),
                SizedBox(
                  height: 20.h,
                ),
                Authbutton(
                    text: 'LOGIN',
                    ontap: () {
                      authcontroller.SignUserUp();
                    }),
                SizedBox(
                  height: 20.h,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Already have an Account? '),
                      TextSpan(
                          text: 'Sign In',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            })
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text('Or'),
                    ),
                    Expanded(child: Divider())
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => authcontroller.LoginInWithGoogle(),
                      child: Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          'assets/google.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
