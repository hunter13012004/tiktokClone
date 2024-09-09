// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountController extends GetxController {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController biocontroller = TextEditingController();
  final TextEditingController youtubecontroller = TextEditingController();
  final TextEditingController instagramcontroller = TextEditingController();

  File? pickedImage;
  void pickImage(ImageSource imgsource) async {
    XFile? selectedImage = await ImagePicker().pickImage(source: imgsource);
    pickedImage = File(selectedImage!.path);
    update();
  }

  Future updateUserDetails() async {
    final String newname = namecontroller.text.trim();
    final String newusername = usernamecontroller.text.trim();
    final String newbio = biocontroller.text.trim();
    final String newinsta = instagramcontroller.text.trim();
    final String newyoutube = youtubecontroller.text.trim();

    String Userid = FirebaseAuth.instance.currentUser!.uid;
    Map<String, dynamic> updatedData = {};

    if (newname != null && newname.isNotEmpty) {
      updatedData['name'] = newname;
    }
    if (newusername != null && newusername.isNotEmpty) {
      updatedData['username'] = newusername;
    }
    if (newbio != null && newbio.isNotEmpty) {
      updatedData['bio'] = newbio;
    }
    if (newinsta != null && newinsta.isNotEmpty) {
      updatedData['instagram'] = newinsta;
    }
    if (newyoutube != null && newyoutube.isNotEmpty) {
      updatedData['youtube'] = newyoutube;
    }

    if (updatedData.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(Userid)
          .update(updatedData);
      update();
    } else {
      print('No Data Updated');
    }
  }
}
