import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tiktok_clone/Models/UserModel.dart';
import 'package:tiktok_clone/Screens/Auth/Login_Screen.dart';
import 'package:tiktok_clone/Screens/Home/Home_Screen.dart';

class AuthController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController Confirmpasswordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Usermodel? currentUser;

  var currentuser = Usermodel(
          id: '',
          name: '',
          username: '',
          email: '',
          instagram: '',
          youtube: '',
          createdon: DateTime.now(),
          bio: '',
          followers: [],
          following: [],
          followers_count: 0,
          following_count: 0,
          likes: 0)
      .obs;

  Future loginUserWithEmailAndPassword() async {
    final String email = emailcontroller.text.trim();
    final String password = passwordcontroller.text.trim();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print('Login success');

      Get.offAll(() => HomeScreen());

      emailcontroller.clear();
      passwordcontroller.clear();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future SignUserUp() async {
    final String name = namecontroller.text.trim();
    final String username = usernamecontroller.text.trim();
    final String email = emailcontroller.text.trim();
    final String password = passwordcontroller.text.trim();
    final String confirmpassword = Confirmpasswordcontroller.text.trim();

    try {
      if (confirmpassword == password) {
        final UserCredential currentuser = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        print('User Created Succesfully');

        Usermodel usermodel = Usermodel(
            id: currentuser.user!.uid.toString(),
            name: name,
            username: username,
            email: email,
            followers: [],
            following: [],
            followers_count: 0,
            following_count: 0,
            likes: 0,
            youtube: '',
            instagram: '',
            createdon: DateTime.now());
        await _firestore
            .collection('users')
            .doc(currentuser.user!.uid)
            .set(usermodel.tomap());
        print('Database Created ');

        Get.offAll(() => HomeScreen());

        emailcontroller.clear();
        passwordcontroller.clear();
      } else {
        throw Exception('Passwords do not match');
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future LoginInWithGoogle() async {
    final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleauth =
        await googleuser!.authentication;
    final AuthCredential googlecreds = GoogleAuthProvider.credential(
        accessToken: googleauth.accessToken, idToken: googleauth.idToken);
    final UserCredential creds = await _auth.signInWithCredential(googlecreds);
    Get.to(() => HomeScreen());
    return creds.user;
  }

  Future LogUserOut() async {
    await _auth.signOut();
    Get.offAll(() => LoginScreen());
  }

  Future<Usermodel> fetchCurrentuserDetails() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: _auth.currentUser!.uid)
        .get();

    if (snapshot.docs.isEmpty) {
      throw Exception("No user found with this email");
    } else if (snapshot.docs.length > 1) {
      throw Exception("Multiple users found with this email");
    }

    final userdata = Usermodel.fromsnap(snapshot.docs.single);
    print(userdata.email);
    print(userdata.name);
    currentUser = userdata;
    return currentUser!;
  }

  @override
  void onInit() {
    fetchCurrentuserDetails();
    super.onInit();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    Confirmpasswordcontroller.dispose();
    super.dispose();
  }
}
