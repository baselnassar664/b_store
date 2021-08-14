import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/screens/Categories/Bags_screen.dart';
import 'package:b_store/screens/Categories/Categories_screen.dart';
import 'package:b_store/screens/Categories/clothes_screen.dart';
import 'package:b_store/screens/Categories/electroics_screen.dart';
import 'package:b_store/screens/Categories/shoes_screen.dart';
import 'package:b_store/screens/auth/Recover_Account.dart';
import 'package:b_store/screens/auth/change_password.dart';
import 'package:b_store/screens/auth/sign_in_screen.dart';
import 'package:b_store/screens/auth/sign_up_screen.dart';
import 'package:b_store/screens/contact_us.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import 'boarding/boarding_screen.dart';
import 'launch_screen.dart';
import 'bottom_bar/main_screen.dart';
import 'screens/about_app.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        initialRoute: '/launch_screen',
      routes: {
       '/launch_screen': (context) => LaunchScreen(),
        '/boarding_screen': (context) => BoardingScreen(),
        '/recover_account_screen': (context) => RecoverAccount(),
        '/sign_in_screen': (context) => SignInScreen(),
        '/sign_up_screen': (context) => SignUpScreen(),
        // '/verify-account_screen': (context) => VerifyAccountScreen(),
        '/main_screen': (context) =>MainScreen(),
        '/categories_screen': (context)=>CategoriesScreen(),
        '/about_app': (context)=>AboutAPP(),
        '/clothes_screen': (context)=>ClothesScreen(),
        '/shoes_screen': (context)=>ShoesScreen(),
        '/bags_screen': (context)=>BagsScreen(),
        '/electronics_screen': (context)=>ElectronicsScreen(),
        '/contactus': (context)=>ContactUs(),
        '/change_password': (context)=>ChangePassword(),
      },
    );
  }
}
