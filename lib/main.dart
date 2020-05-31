import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/home_screens/home_screen.dart';
import 'package:whatsapp/home_screens/new_group_screen.dart';
import 'package:whatsapp/setup_screens/phone_number_screen.dart';
import 'package:whatsapp/setup_screens/profile_screen.dart';
import 'package:whatsapp/setup_screens/verify_number_screen.dart';
import 'package:whatsapp/setup_screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

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
