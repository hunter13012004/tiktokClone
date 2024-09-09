import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/Screens/Auth/Auth_screen/Auth_Screen.dart';
import 'package:tiktok_clone/controllers/Theme_Controller.dart';
import 'package:tiktok_clone/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themecontroller = Get.put(ThemeController());
    return ScreenUtilInit(
      designSize: Size(360, 890),
      minTextAdapt: true,
      builder: (context, child) => Obx(
        () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: AuthScreen(),
            theme: themecontroller.isthemedark.value
                ? themecontroller.Darktheme
                : themecontroller.lighttheme),
      ),
    );
  }
}
