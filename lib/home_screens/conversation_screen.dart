import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatsapp/home_screens/calls_tab.dart';
import 'package:whatsapp/home_screens/chats_tab.dart';
import 'package:whatsapp/home_screens/starredmessages_screen.dart';
import 'package:whatsapp/home_screens/status_tab.dart';
import 'package:whatsapp/home_screens/new_broadcast_screen.dart';
import 'package:whatsapp/home_screens/new_group_screen.dart';
import 'package:whatsapp/home_screens/settings_screen.dart';
import 'package:whatsapp/home_screens/whatsappweb_screen.dart';
import 'package:whatsapp/setup_screens/welcome_screen.dart';
import 'package:whatsapp/strings.dart';
import 'package:whatsapp/colors.dart';

class ConversationScreen extends StatelessWidget {
  static final String id = 'conversation';
  List<String> _chats = [
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
    'Chat 1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chats.length,
              itemBuilder: (context, i) => Text(
                _chats[i].toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          buildBottomBar(context),
        ],
      ),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
//      leading: Row(
//        children: [
//          ,
//        ],
//      ),
      titleSpacing: 0,
      backgroundColor: primColorDark,
      title: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(
          child: Icon(Icons.person, color: Colors.white, size: 30),
          radius: 20,
          backgroundColor: avatarBgColor,
        ),
        title: Text(
          'Leo',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text('last seen today at 3:55PM',
            style: TextStyle(color: Colors.white)),
      ),
      actions: buildActions(context),
    );
  }

  buildBottomBar(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(30),
            right: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10,right:10),
              child: Icon(
                Icons.tag_faces,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.attachment,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:4.0,vertical: 8.0),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      trailing: CircleAvatar(
          backgroundColor: primColorDark,
          child: Icon(Icons.mic, color: Colors.black)),
    );
  }

  buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      PopupMenuButton(
        onSelected: (title) {
          if (title == new_group_text) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => NewGroupScreen()),
            );
          } else if (title == new_broadcast_text) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => NewBroadcastScreen()),
            );
          } else if (title == whatsapp_web_text) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => WhatsappwebScreen()),
            );
          } else if (title == starred_messages_text) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => StarredmessagesScreen()),
            );
          } else if (title == settings_text) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => SettingsScreen()),
            );
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
            new_group_text,
            new_broadcast_text,
            whatsapp_web_text,
            starred_messages_text,
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
    ];
  }

  buildMenuItem(String title, BuildContext context) {
    return Text(title);
  }
}
