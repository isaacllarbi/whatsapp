import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatsapp/screens/home_screens/calls_tab.dart';
import 'package:whatsapp/screens/home_screens/chats_tab.dart';
import 'package:whatsapp/screens/home_screens/status_tab.dart';
import 'package:whatsapp/screens/new_group_screen.dart';
import 'package:whatsapp/screens/settings_screen.dart';
import 'package:whatsapp/screens/welcome_screen.dart';
import 'package:whatsapp/strings.dart';
import 'package:whatsapp/colors.dart';

class HomeScreen extends StatelessWidget {
  static final String id = 'homescreen';

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   initialIndex: 2,
    //   length: 4,
    //   child: Scaffold(
    //     body: CustomScrollView(
    //       slivers: <Widget>[
    //         SliverAppBar(
    //           backgroundColor: Color.fromRGBO(7, 94, 84, 1),
    //           title: Text(
    //             'WhatsApp',
    //           ),
    //           bottom: buildTabBar(),
    //           actions: buildActions(context),
    //         ),
    //         SliverList(
    //           delegate: SliverChildBuilderDelegate(
    //             (BuildContext ctx, int i) {
    //               return Column(children: <Widget>[
    //                 ListTile(title: Text('hello')),
    //                 ListTile(title: Text('hello')),
    //                 ListTile(title: Text('hello'))
    //               ],);
    //             },
    //             childCount: 5,
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );

    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(children: <Widget>[
          Text('Camera'),
          ChatTab(),
          StatusTab(),
          CallsTab(),
        ]),
      ),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(7, 94, 84, 1),
      title: Text(
        'WhatsApp',
      ),
      bottom: buildTabBar(),
      actions: buildActions(context),
    );
  }

  buildTabBar() {
    return TabBar(
      tabs: <Widget>[
        Tab(child: Icon(Icons.camera_alt)),
        Tab(child: Text(chats_text.toUpperCase())),
        Tab(child: Text(status_text.toUpperCase())),
        Tab(child: Text(calls_text.toUpperCase())),
      ],
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
            Navigator.of(context).pushNamed(NewGroupScreen.id);
          } else if (title == new_broadcast_text) {
            //TODO implement navigation
          } else if (title == whatsapp_web_text) {
            //TODO implement navigation
          } else if (title == starred_messages_text) {
            //TODO implement navigation
          } else if (title == settings_text) {
            //TODO implement navigation
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => SettingsScreen(),
            ));
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
