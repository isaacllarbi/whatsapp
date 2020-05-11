import 'package:flutter/material.dart';
import 'package:whatsapp/screens/phone_number_screen.dart';
import 'package:whatsapp/screens/verify_number_screen.dart';
import 'package:whatsapp/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITman',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: VerifyNumberScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        VerifyNumberScreen.id: (context) => VerifyNumberScreen(),
        PhoneNumberScreen.id: (context) => PhoneNumberScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        
      },
    );
  }
}
