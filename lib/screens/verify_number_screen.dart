import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/home_screen.dart';
import 'package:whatsapp/screens/profile_screen.dart';
import 'package:whatsapp/strings.dart';
import 'package:whatsapp/colors.dart';

class VerifyNumberScreen extends StatelessWidget {
  static final String id = 'verifynumberscreen';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            verify_text,
            style: TextStyle(color: Theme.of(context).primaryColorDark),
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            child: Icon(Icons.more_vert, color: appBarIconColor),
            itemBuilder: (BuildContext context) {
              return ['Help', 'About']
                  .map((item) => PopupMenuItem(
                        value: item,
                        child: Text(item),
                        enabled: true,
                      ))
                  .toList();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Text(we_have_sent_sms_text),
          Text(wrong_number_text, style: TextStyle(color: alternateTextColor)),
          SizedBox(height: 6),
          SizedBox(
            width: 150,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    hintText: dashes_text +
                        dashes_text +
                        dashes_text +
                        "  " +
                        dashes_text +
                        dashes_text +
                        dashes_text),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(enter_six_digit_code_text),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.message),
                SizedBox(width: 14),
                Text(resend_sms_text),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.call),
                SizedBox(width: 14),
                Text(call_me_text),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: RaisedButton(
              child: Text(next.toUpperCase(),),
              onPressed: () =>
                  Navigator.of(context).pushNamed(ProfileScreen.id),
            ),
          )
        ],
      ),
    );
  }
}
