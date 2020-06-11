import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/components/action_button.dart';
import 'package:whatsapp/models/Chat.dart';
import 'package:whatsapp/colors.dart';
import 'package:grouped_list/grouped_list.dart';

class ConversationScreen extends StatefulWidget {
  static final String id = 'conversation';

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  List<dynamic> chats = [
    {"id": '1', "msg": 'Hello', 'date': 'monday'},
    {"id": 'me', "msg": 'Hello', 'date': 'monday'},
    {"id": 'me', "msg": 'How are you doing', 'date': 'tuesday'},
    {"id": '1', "msg": "I'm cool", 'date': 'tuesday'},
  ];
  bool typing = false;
  TextEditingController textCtrl;

  @override
  void initState() {
    textCtrl = TextEditingController();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: buildAppBar(context),
      body: Column(
        children: [
          buildConversation(),
          buildBottomBar(context),
        ],
      ),
    );
  }

  Widget buildChatItem(context, chat) {
    bool isMe = chat['id'] == 'me';
    return Container(
      margin: EdgeInsets.only(
          top: 4.0, bottom: 4.0, left: isMe ? 120 : 10, right: 10),
      width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.all(5),
      child: Text(
        chat['msg'].toString(),
        style: TextStyle(fontSize: 16),
      ),
      decoration: BoxDecoration(
        color: isMe ? Colors.lightGreenAccent.shade100 : Color(0xFFFFEFEE),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    );
  }

  Expanded buildConversation() {
    return Expanded(
      child: GroupedListView<dynamic, String>(
        groupBy: (chat) => chat['date'],
        elements: chats,
        order: GroupedListOrder.ASC,
        useStickyGroupSeparators: false,
        groupSeparatorBuilder: buildDate,
        itemBuilder: buildChatItem,
      ),
    );
  }

  Widget buildDate(String value) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(3),
            child: Text(
              value.toUpperCase(),
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(5),
                right: Radius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildChatUI() {
    return Expanded(
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, i) {
          return chats[i]['id'] == 'me'
              ? buildRightChat(context, i)
              : buildLeftChat(context, i);
        },
      ),
    );
  }

  Container buildLeftChat(BuildContext context, int i) {
    return Container(
      margin: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 10, right: 100),
      width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.all(5),
      child: Text(
        chats[i]['msg'].toString(),
        style: TextStyle(fontSize: 16),
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFFEFEE),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    );
  }

  Container buildRightChat(BuildContext context, int i) {
    return Container(
      margin: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 120.0, right: 10),
      width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.all(5),
      child: Text(
        chats[i]['msg'].toString(),
        style: TextStyle(fontSize: 16),
      ),
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent.shade100,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
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
            style: TextStyle(color: Colors.white, fontSize: 12)),
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
            emojiButton(),
            textInput(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [attachmentButton(), cameraButton()],
            ),
          ],
        ),
      ),
      trailing: micButton(),
    );
  }

  CircleAvatar micButton() {
    return CircleAvatar(
      backgroundColor: primColorDark,
      child: Icon(typing ? Icons.send : Icons.mic,
          color: Colors.black),
    );
  }

  Padding cameraButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: Icon(Icons.camera_alt, color: Colors.black),
    );
  }

  Padding attachmentButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(Icons.attachment, color: Colors.black),
    );
  }

  Padding emojiButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          print('emoji clicked');
        },
        child: Icon(
          Icons.tag_faces,
          color: Colors.black,
        ),
      ),
    );
  }

  Expanded textInput() {
    return Expanded(
      child: TextField(
        controller: textCtrl,
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
    );
  }

  buildActions(BuildContext context) {
    return [
      ActionButton(
        icon: Icons.videocam,
        onPressed: () {},
      ),
      ActionButton(
        icon: Icons.call,
        onPressed: () {},
      ),
      PopupMenuButton(
        onSelected: (title) {
          // if (title == new_group_text) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (ctx) => NewGroupScreen()),
          //   );
          // } else if (title == new_broadcast_text) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (ctx) => NewBroadcastScreen()),
          //   );
          // } else if (title == whatsapp_web_text) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (ctx) => WhatsappwebScreen()),
          //   );
          // } else if (title == starred_messages_text) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (ctx) => StarredmessagesScreen()),
          //   );
          // } else if (title == settings_text) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (ctx) => SettingsScreen()),
          //   );
          // } else if (title == exit_text) {
          //   Navigator.of(context).pushNamed(WelcomeScreen.id);
          // }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.more_vert),
        ),
        itemBuilder: (BuildContext context) {
          return [
            'View contact',
            'Media, links, and docs',
            'Search',
            'Mute notifications',
            'Wallpaper',
            'More',
            'Go To First Message',
            'Search Web',
            'Clear Recent Emojis',
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
    return Row(
      children: [
        Text(title),
      ],
    );
  }
}
