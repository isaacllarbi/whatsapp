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

  buildUserInfo() {
    return ListTile(
      onTap: () {
        print('user tapped');
      },
      leading: CircleAvatar(
        child: Icon(Icons.person, color: Colors.white, size: 40),
        radius: 25,
        backgroundColor: avatarBgColor,
      ),
      title: Text(
        'Isaac Larbi',
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
      ),
      subtitle: Text(hey_there_i_am_text),
    );
  }

  buildSettingItem(BuildContext ctx, IconData icon, String title, String desc) {
    return ListTile(
      onTap: () {
        print('setting item clicked');
      },
      leading: Icon(icon, color: Theme.of(ctx).primaryColor, size: 22),
      title: Text(
        title.isNotEmpty ? title : '',
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
      ),
      subtitle: desc.isNotEmpty ? Text(desc) : SizedBox.shrink(),
    );
  }
}
