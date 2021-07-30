import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'auth/Recover_Account.dart';
import 'auth/reset_password_screen.dart';
import 'auth/sign_in_screen.dart';
import 'auth/sign_up_screen.dart';
import 'auth/veirfy_account_reset_password.dart';
import 'auth/verify-account_screen.dart';
import 'boarding/boarding_screen.dart';
import 'launch_screen.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
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
        '/verify-account_screen': (context) => VerifyAccountScreen(),
        '/reset_password_screen': (context) => ResetPasswordScreen(),
        '/verify_account_reset_password': (context) => VerifyAccountResetPassword(),
      },
    );
  }
}
