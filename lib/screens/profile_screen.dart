import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/home_screen.dart';
import 'package:whatsapp/strings.dart';
import 'package:whatsapp/colors.dart';

class ProfileScreen extends StatelessWidget {
  static final String id = 'profilescreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            profile_info_text,
            style: TextStyle(color: appBarTitleColor),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    please_provide_your_name_text,
                    style: TextStyle(color: faintTextColor),
                  ),
                  SizedBox(height: 24),
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: avatarBgColor,
                    child: Icon(Icons.camera_alt,
                        size: 50, color: iconNeutralColor),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: type_your_name_here_text,
                                isDense: true),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.tag_faces),
                          onPressed: () {
                            //TODO implement onpressed
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 120),
              child: RaisedButton(
                color: btnBgColor,
                child: Text(
                  next,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: btnTextColor),
                ),
                onPressed: () {
                  //implement onpressed
                  // showDialog(context: context,builder: (BuildContext context){
                  //   return buildGDrivePermissionDialog(context);
                  // });

                  Navigator.of(context).pushNamed(HomeScreen.id);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildGDrivePermissionDialog(context) {
  return AlertDialog(
    contentPadding: EdgeInsets.all(0),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          color: btnTextPimaryColor,
          height: 140,
          child: Center(
            child: Icon(
              Icons.contacts,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(to_find_your_backup),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              // color: btnBgColor,
              child:
                  Text('NOT NOW', style: TextStyle(color: btnTextPimaryColor)),
              onPressed: () {
                //TODO close dialog and navigate to next screen
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              // color: btnBgColor,
              child:
                  Text('CONTINUE', style: TextStyle(color: btnTextPimaryColor)),
              onPressed: () {
                //TODO request permission to access sms
                Navigator.of(context).pop();
              },
            )
          ],
        )
      ],
    ),
  );
}
