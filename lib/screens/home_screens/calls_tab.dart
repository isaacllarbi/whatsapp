import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/strings.dart';

class CallsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool contactPermissionGranted = true;

    return Scaffold(
      body: contactPermissionGranted
          ? buildCallsList(context)
          : buildPermissionRequest(context),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add_call,color: Colors.white),
      ),
    );
  }

  buildCallsList(BuildContext context) {
    var list = List.generate(100, (index) {
      return index;
    });

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Padding(
          padding: EdgeInsets.only(left: 16, bottom: 10, right: 5, top: 10),
          child: Row(
            children: <Widget>[
              buildChatAvatar(),
              buildChatDetails(context),
              buildChatTimeAndCount(context),
            ],
          ),
        );
      },
    );
  }

  Container buildChatTimeAndCount(BuildContext context) {
    return Container(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 10),
        child: IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.call,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
    );
  }

  Expanded buildChatDetails(BuildContext context) {
    return Expanded(
      child: Container(
        height: 45,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              buildChatName(),
              buildChatSnippet(context),
            ],
          ),
        ),
      ),
    );
  }

  buildChatSnippet(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.call_made, color: Theme.of(context).accentColor),
          SizedBox(width: 10),
          Text('Today, 9:37 AM')
        ],
      );

  Text buildChatName() {
    return Text(
      'Isaac Larbi',
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    );
  }

  CircleAvatar buildChatAvatar() {
    return CircleAvatar(
      child: Icon(Icons.person, color: Colors.white, size: 40),
      radius: 25,
      backgroundColor: avatarBgColor,
    );
  }

  buildPermissionRequest(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 65),
          Center(
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 100,
              child: Icon(
                Icons.contacts,
                color: Colors.white,
                size: 70,
              ),
            ),
          ),
          SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
                child: Text(
              to_help_you_message_friends,
              style: TextStyle(),
            )),
          ),
          SizedBox(height: 45),
          RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text(
              settings_text.toUpperCase(),
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            onPressed: () {
              //TODO implement onpressed
            },
          ),
        ],
      ),
    );
  }
}
