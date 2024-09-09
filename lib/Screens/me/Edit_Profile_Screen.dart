import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/Screens/me/utils/account_info_tile.dart';
import 'package:tiktok_clone/controllers/Account_Controller.dart';
import 'package:tiktok_clone/controllers/Auth_Controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var accountcontroller = Get.put(AccountController());
    var authcontroller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Container(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: (accountcontroller.pickedImage != null &&
                      accountcontroller.pickedImage!.path.isNotEmpty)
                  ? FileImage(File(accountcontroller.pickedImage!.path))
                  : AssetImage('assets/images/user.png') as ImageProvider,
              // FileImage(File(accountcontroller.pickedImage!.path == ' ' ? AssetImage('assts/images/user.png'): File(accountcontroller.pickedImage!.path)  )),

              radius: 80.r,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
              onTap: () => showDialog(
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Select Image'),
                            ListTile(
                              onTap: () {
                                accountcontroller.pickImage(ImageSource.camera);
                                Get.back();
                              },
                              title: Text('Pick from camera'),
                              leading: Icon(Icons.camera),
                            ),
                            ListTile(
                              onTap: () {
                                accountcontroller.pickImage(ImageSource.camera);
                                Get.back();
                              },
                              title: Text('Pick from Gallery'),
                              leading: Icon(Icons.image),
                            ),
                            ListTile(
                              onTap: () {
                                Get.back();
                              },
                              title: Text('Cancel'),
                              leading: Icon(Icons.cancel),
                            )
                          ],
                        ),
                      );
                    },
                    context: context,
                  ),
              child: Text('Change Photo')),
          SizedBox(
            height: 50.h,
          ),
          Container(
            height: 328.h,
            width: MediaQuery.of(context).size.width.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccountInfoTile(
                      input: authcontroller.currentUser?.name ?? '',
                      titletext: 'Name',
                      ontap: () {
                        showDialog(
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller:
                                        accountcontroller.namecontroller,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        accountcontroller.updateUserDetails();
                                      },
                                      child: Text('Change'))
                                ],
                              ),
                            );
                          },
                          context: context,
                        );
                      }),
                  AccountInfoTile(
                      input: authcontroller.currentUser?.username ?? '',
                      titletext: 'UserName',
                      ontap: () {}),
                  AccountInfoTile(
                      input: authcontroller.currentUser?.email ?? '',
                      titletext: 'Email',
                      ontap: () {}),
                  AccountInfoTile(
                      input: authcontroller.currentUser?.bio ?? 'Enter Bio',
                      titletext: 'Bio',
                      ontap: () {}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Expanded(child: Divider())],
                  ),
                  AccountInfoTile(
                      input: authcontroller.currentUser?.instagram ??
                          'add Instagram',
                      titletext: 'Instagram',
                      ontap: () {}),
                  AccountInfoTile(
                      input:
                          authcontroller.currentUser?.youtube ?? 'add Youtube',
                      titletext: 'Youtube',
                      ontap: () {})
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
