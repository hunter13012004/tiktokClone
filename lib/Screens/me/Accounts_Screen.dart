// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/Screens/me/Edit_Profile_Screen.dart';
import 'package:tiktok_clone/const/constStyle.dart';
import 'package:tiktok_clone/controllers/Account_Controller.dart';
import 'package:tiktok_clone/controllers/Auth_Controller.dart';
import 'package:tiktok_clone/controllers/Theme_Controller.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    var authcontroller = Get.put(AuthController());
    var acccontroller = Get.put(AccountController());
    var themecontroller = Get.put(ThemeController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.3,
          actions: [
            IconButton(
                onPressed: () {
                  themecontroller.changeTheme();
                },
                icon: Icon(Icons.more_horiz))
          ],
          leading: IconButton(
              onPressed: () {
                authcontroller.LogUserOut();
              },
              icon: Icon(Icons.person_add_alt_1_outlined)),
          centerTitle: true,
          title: Text(authcontroller.currentUser?.name ?? ''),
        ),
        body: Column(
          children: [
            Container(
              height: 318.h,
              width: MediaQuery.of(context).size.width.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 96.h,
                    width: 96.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: (acccontroller.pickedImage != null &&
                                    acccontroller.pickedImage!.path.isNotEmpty)
                                ? FileImage(
                                    File(acccontroller.pickedImage!.path))
                                : AssetImage('assets/images/user.png')
                                    as ImageProvider,
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                        color: Colors.white),
                  ),
                  Text(
                    authcontroller.currentUser?.email ?? '',
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 250,
                    height: 41,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(authcontroller.currentUser?.following_count
                                    .toString() ??
                                ''),
                            Text('Following')
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(authcontroller.currentUser?.followers_count
                                    .toString() ??
                                ''),
                            Text('Followers')
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(authcontroller.currentUser?.likes.toString() ??
                                ''),
                            Text('Likes')
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 210.w,
                    height: 44.h,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => EditProfileScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            width: 164.w,
                            child: Center(child: Text('Edit Profile')),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Expanded(
                          child: Container(
                            width: 44.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Center(child: Icon(Icons.save)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text('Add Bio'),
                  Row(
                    children: [Expanded(child: Divider())],
                  ),
                ],
              ),
            ),
            Expanded(
                child: GridView.builder(
              itemCount: 10,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Icon(Icons.home);
              },
            ))
          ],
        ));
  }
}
