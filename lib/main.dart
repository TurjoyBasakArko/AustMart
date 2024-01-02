import 'package:austmart/SplashScreen/splash_screen.dart';
<<<<<<< HEAD
import 'package:firebase_core/firebase_core.dart';
=======
>>>>>>> ce882405e26fda9312b11f799089aeb01d9d694f
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'consts/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
        apiKey: "AIzaSyBEFq_zChjwzgJ1uyRFrYTUz4Q8Zl0DQTM",
        projectId: "austmart-c9662",
        messagingSenderId: "298399611911",
        appId: " 1:298399611911:android:a184652a5e7db1cee3bea2",

    ),
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
=======
>>>>>>> ce882405e26fda9312b11f799089aeb01d9d694f
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme:const AppBarTheme(backgroundColor:Colors.transparent),
        fontFamily:regular,
      ),
      home:const SplashScreen(),
    );
  }
}
