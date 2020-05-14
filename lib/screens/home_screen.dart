import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatsapp/screens/home_screens/chats_screen.dart';
import 'package:whatsapp/screens/home_screens/status_screen.dart';
import 'package:whatsapp/screens/welcome_screen.dart';
import 'package:whatsapp/strings.dart';
import 'package:whatsapp/colors.dart';

class HomeScreen extends StatelessWidget {
  static final String id = 'homescreen';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColorDark,
          title: Text(
            'WhatsApp',
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(child: Icon(Icons.camera_alt)),
              Tab(child: Text(chats_text)),
              Tab(child: Text(status_text)),
              Tab(child: Text(calls_text)),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            PopupMenuButton(
              onSelected: (title) {
                if (title == message_a_number_text) {
                  // Fluttertoast.showToast(msg: 'Navigation not implemented');
                  //TODO implement navigation
                } else if (title == new_group_text) {
                  //TODO implement navigation
                } else if (title == new_broadcast_text) {
                  //TODO implement navigation
                } else if (title == whatsapp_web_text) {
                  //TODO implement navigation
                } else if (title == settings_text) {
                  //TODO implement navigation
                } else if (title == exit_text) {
                  Navigator.of(context).pushNamed(WelcomeScreen.id);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.more_vert),
              ),
              itemBuilder: (BuildContext context) {
                return [
                  message_a_number_text,
                  new_group_text,
                  new_broadcast_text,
                  whatsapp_web_text,
                  settings_text,
                  exit_text
                ]
                    .map((title) => PopupMenuItem(
                          value: title,
                          child: buildMenuItem(title, context),
                          enabled: true,
                        ))
                    .toList();
              },
            ),
          ],
        ),
        body: TabBarView(children: <Widget>[
          Text('Camera'),
          ChatScreen(),
          StatusScreen(), 
          Text('Calls'),
        ]),
      ),
    );
  }

  buildMenuItem(String title, BuildContext context) {
    return Text(title);
  }
}
