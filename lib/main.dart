import 'package:b_store/preferences/student_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:get/get.dart';


import 'db/db_provilder.dart';
import 'fb_noftification/fb_notifications.dart';
import 'get/language.dart';

import 'launch_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider().initDatabase();
  await StudentPreferences().initPreferences();





  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MainApp());
}
class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     translations:  AppLocale(),
      locale: Locale(StudentPreferences().languageCode),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(

            textTheme: TextTheme(
              headline6: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              )
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
            color: Color(0xff586BCA),
              size: 24,
            )
          ),

        ),
        home: LaunchScreen(),

    );
  }
}
