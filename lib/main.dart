import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp/colors.dart';

import 'screens/home/home_screen.dart';
import 'screens/phone_number/phone_number_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/verification/verify_number_screen.dart';
import 'screens/welcome/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp',
      theme: ThemeData(
        primaryColor: primColor,
        primaryColorDark: primColorDark,
        accentColor: accentColor,
        buttonTheme: ButtonThemeData(buttonColor: accentColor),
        // fontFamily: GoogleFonts,
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
