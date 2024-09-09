import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/Screens/Auth/Signup_Screen.dart';
import 'package:tiktok_clone/const/constStyle.dart';
import 'package:tiktok_clone/controllers/Auth_Controller.dart';
import 'package:tiktok_clone/widgets/AuthButton.dart';
import 'package:tiktok_clone/widgets/AuthFeilds.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var authcontroller = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
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
              Authbutton(
                  text: 'LOGIN',
                  ontap: () {
                    authcontroller.loginUserWithEmailAndPassword();
                  }),
              SizedBox(
                height: 20.h,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Don\'t have an Account? '),
                    TextSpan(
                        text: 'Sign up',
                        style: TextStyle(color: Colors.red),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => SignupScreen());
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
                height: 50.h,
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
    );
  }
}
