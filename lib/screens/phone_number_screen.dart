import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/verify_number_screen.dart';
import 'package:whatsapp/strings.dart';
import 'package:whatsapp/colors.dart';

class PhoneNumberScreen extends StatelessWidget {
  static final String id = 'enterphonenumberscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            enter_number_text,
            style: TextStyle(color: Theme.of(context).primaryColorDark),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert, color: appBarIconColor),
            onPressed: () {
              //TODO implement on press
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(send_sms_text + ' ' + what_is_my_number_text),
                ),
                GestureDetector(
                  onTap: () {
                    //TODO implement on press
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      initialValue: "Ghana",
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_downward)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          //TODO implement on press
                        },
                        child: SizedBox(
                          width: 85,
                          child: TextFormField(
                            initialValue: "233",
                            decoration:
                                InputDecoration(prefixIcon: Icon(Icons.add)),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO implement on press
                      },
                      child: SizedBox(
                        width: 200,
                        child: TextFormField(
                          decoration: InputDecoration(hintText: phone_number),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  carrier_sms,
                  style: TextStyle(color: faintTextColor, fontSize: 16),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RaisedButton(
              child: Text(
                next.toUpperCase(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              onPressed: () {
                //implement onpressed
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return buildDialog1(context);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget buildDialog1(context) {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(we_will_verify_text),
        SizedBox(height: 20),
        Text(phone_number_sample),
        SizedBox(height: 20),
        Text(is_this_ok_text),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(
              child: Text('EDIT', style: TextStyle(color: Colors.white)),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('OK', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pushNamed(VerifyNumberScreen.id);
              },
            )
          ],
        )
      ],
    ),
  );
}

Widget buildDialog2(BuildContext context) {
  return AlertDialog(
    contentPadding: EdgeInsets.all(0),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          color: Theme.of(context).primaryColor,
          height: 140,
          child: Center(
            child: Icon(
              Icons.message,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(to_easily_verify_text),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              // color: btnBgColor,
              child:
                  Text('NOT NOW', style: TextStyle(color:  Theme.of(context).primaryColor)),
              onPressed: () {
                //TODO close dialog and navigate to next screen
              },
            ),
            FlatButton(
              // color: btnBgColor,
              child:
                  Text('CONTINUE', style: TextStyle(color:  Theme.of(context).primaryColor)),
              onPressed: () {
                //request permission to access sms
              },
            )
          ],
        )
      ],
    ),
  );
}
