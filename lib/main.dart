import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/screens/home_screen.dart';
import 'package:whatsapp/screens/phone_number_screen.dart';
import 'package:whatsapp/screens/profile_screen.dart';
import 'package:whatsapp/screens/verify_number_screen.dart';
import 'package:whatsapp/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var primColor = Color.fromRGBO(18, 140, 126, 1);
  var primColorDark = Color.fromRGBO(7, 94, 84, 1);
  var accentColor = Color.fromRGBO(37, 211, 102, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITman',
      theme: ThemeData(
        primaryColor: primColor,
        primaryColorDark: primColorDark,
        accentColor: accentColor,
        buttonTheme: ButtonThemeData(buttonColor: accentColor),
      ),
      initialRoute: HomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        VerifyNumberScreen.id: (context) => VerifyNumberScreen(),
        PhoneNumberScreen.id: (context) => PhoneNumberScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
