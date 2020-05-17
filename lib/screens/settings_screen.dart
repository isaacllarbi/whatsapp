import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/strings.dart';

class SettingsScreen extends StatelessWidget {
  static final String id = 'settings_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(settings_text),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildUserInfo(),
            Divider(height: 3),
            SizedBox(height: 20),
            buildSettingItem(
              context,
              Icons.vpn_key,
              account_text,
              privacy_text +
                  ', ' +
                  security_text.toLowerCase() +
                  ', ' +
                  change_number_text.toLowerCase(),
            ),
            buildSettingItem(
              context,
              Icons.chat,
              chats_text,
              theme_text +
                  ', ' +
                  wallpapers_text.toLowerCase() +
                  ', ' +
                  chat_history_text.toLowerCase(),
            ),
            buildSettingItem(
              context,
              Icons.notifications,
              notifications_text,
              message_text +
                  ', ' +
                  group_text.toLowerCase() +
                  ', ' +
                  call_tones_text.toLowerCase(),
            ),
            buildSettingItem(
              context,
              Icons.data_usage,
              data_text + ' ' + storage_usage_text.toLowerCase(),
              network_usage_text + ', ' + auto_download_text.toLowerCase(),
            ),
            buildSettingItem(
              context,
              Icons.help_outline,
              help_text,
              faq_text +
                  ', ' +
                  contact_us_text.toLowerCase() +
                  ', ' +
                  privacy_policy_text.toLowerCase(),
            ),
            buildSettingItem(
              context,
              Icons.people,
              invite_text,
              '',
            ),
          ],
        ),
      ),
    );
  }

  buildSettingItem(
    BuildContext context,
    IconData iconData,
    String title,
    String desc,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 10, right: 5, top: 10),
      child: Row(
        children: <Widget>[
          Icon(iconData, color: Theme.of(context).primaryColor, size: 22),
          Expanded(
            child: Container(
              height: 40,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      title.isNotEmpty ? title : '',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    desc.isNotEmpty ? Text(desc) : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildUserInfo() {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 10, right: 5, top: 10),
      child: Row(
        children: <Widget>[
          buildAvatar(),
          buildDetails(),
        ],
      ),
    );
  }

  CircleAvatar buildAvatar() {
    return CircleAvatar(
      child: Icon(Icons.person, color: Colors.white, size: 40),
      radius: 25,
      backgroundColor: avatarBgColor,
    );
  }

  Expanded buildDetails() {
    return Expanded(
      child: Container(
        height: 40,
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              buildName(),
              buildBio(),
            ],
          ),
        ),
      ),
    );
  }

  Text buildName() {
    return Text(
      'Isaac Larbi',
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
    );
  }

  Text buildBio() => Text('..');
}
