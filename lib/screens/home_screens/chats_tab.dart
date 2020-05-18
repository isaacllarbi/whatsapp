import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/strings.dart';

class ChatTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool contactPermissionGranted = true;
    return Scaffold(
      body: contactPermissionGranted
          ? buildList(context)
          : buildPermissionRequest(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(MaterialCommunityIcons.message, color: Colors.white),
      ),
    );
  }

  buildList(BuildContext context) {
    var list = List.generate(100, (index) {
      return index;
    });

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          leading: buildLeading(context),
          title: buildTitle(),
          subtitle: buildSubtitle(context),
          trailing: buildTrailing(context),
        );
      },
    );
  }

   buildLeading(BuildContext context) {
    return faker.randomGenerator.boolean()
        ? CircleAvatar(
            child: Icon(Icons.person, color: Colors.white, size: 40),
            radius: 25,
            backgroundColor: avatarBgColor,
          )
        : CircleAvatar(
            child: Icon(Icons.person,
                color: Theme.of(context).accentColor, size: 40),
            radius: 25,
            backgroundColor: avatarBgColor,
          );
  }


   buildTitle() {
    return Text(
      faker.person.firstName() + " " + faker.person.lastName(),
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    );
  }

  buildSubtitle(BuildContext context) {
    return Text(
      faker.lorem.sentence(),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.black.withOpacity(0.5)),
    );
  }

 
   buildTrailing(BuildContext context) {
    return Container(
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            '1:22 PM',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: fainterTextColor,
                fontSize: 12),
          ),
          CircleAvatar(
            radius: 10,
            backgroundColor: Theme.of(context).accentColor,
            child: Center(
              child: Text(
                faker.randomGenerator.integer(15).toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
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
