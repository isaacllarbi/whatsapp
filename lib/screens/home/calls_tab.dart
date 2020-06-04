import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';

class CallsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = List.generate(100, (index) {
      return index;
    });
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext ctx, int index) {
          return ListTile(
            onTap: () {
              print('call clicked');
            },
            leading: buildLeading(),
            title: buildTitle(),
            subtitle: buildSubtitle(context),
            trailing: buildTrailing(context),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_call, color: Colors.white),
      ),
    );
  }

  buildLeading() {
    return CircleAvatar(
      child: Icon(Icons.person, color: Colors.white, size: 40),
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
    return Row(
      children: <Widget>[
        Icon(Icons.call_made, color: Theme.of(context).accentColor),
        SizedBox(width: 2),
        Text('Today at, ' + faker.date.time().toString())
      ],
    );
  }

  buildTrailing(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.call,
        color: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
