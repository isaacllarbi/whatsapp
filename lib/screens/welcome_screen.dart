import 'package:flutter/material.dart';
import 'package:whatsapp/screens/phone_number_screen.dart';
import 'package:whatsapp/strings.dart';
import 'package:whatsapp/colors.dart';

class WelcomeScreen extends StatelessWidget {
  static final String id = 'welcomescreen';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 50),
              buildPageHeading(context),
              SizedBox(height: 70),
              buildImage(),
              SizedBox(height: 80),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Center(
                  child: Text(
                    tos,
                    style: TextStyle(fontSize: 14, color: faintTextColor),
                  ),
                ),
              ),
              SizedBox(height: 100),
              buildContinueButton(context),
              SizedBox(height: 50),
              Text(
                whatsapp_from_fb_text,
                style: TextStyle(fontSize: 12, color: fainterTextColor),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildContinueButton(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 300,
      child: RaisedButton(
        child: Text(
          agree_and_continue_btn_text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(PhoneNumberScreen.id);
        },
      ),
    );
  }

  CircleAvatar buildImage() =>
      CircleAvatar(backgroundColor: Colors.green.shade200, radius: 130);

  Text buildPageHeading(BuildContext context) {
    return Text(
      welcome,
      style: TextStyle(
        fontSize: 28,
        color: Theme.of(context).primaryColorDark,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
