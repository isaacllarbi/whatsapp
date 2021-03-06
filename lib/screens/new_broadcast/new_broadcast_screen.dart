import 'package:faker/faker.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:whatsapp/components/action_button.dart';
import 'package:whatsapp/strings.dart';
import 'package:whatsapp/colors.dart';
import 'package:flutter/material.dart';

class NewBroadcastScreen extends StatefulWidget {
  static final String id = 'newgroupscreen';

  @override
  _NewBroadcastScreenState createState() => _NewBroadcastScreenState();
}

class _NewBroadcastScreenState extends State<NewBroadcastScreen> {
  var contacts = List.generate(
    100,
    (index) => {
      "id": index,
      "name": faker.person.firstName() + ' ' + faker.person.lastName(),
      "time": faker.date.time().toString()
    },
  );

  var selected = List.generate(
    10,
    (index) => {
      "id": index,
      "name": faker.person.firstName() + ' ' + faker.person.lastName(),
      "time": faker.date.time().toString()
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: CustomScrollView(
        slivers: [
          buildSelectedList(context),
//          Divider(),
          buildContactList(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check,color: Colors.white,),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {},
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: ListTile(
        title: Text(
          new_broadcast_text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          "0 of 1024 selected",
          style: TextStyle(color: Colors.white),
        ),
      ),
      actions: [
        ActionButton(
          icon: Icons.search,
          onPressed: () {},
        )
      ],
    );
  }

  buildSelectedList(BuildContext context) {
    return SliverStickyHeader(
      sticky: false,
      header: SizedBox.shrink(),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext ctx, int i) {
            return Container(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selected.length,
                itemBuilder: (BuildContext ctx, int i) {
                  return InkWell(
                    onTap: () {
                      print(selected[i].toString());
                    },
                    child: Center(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                        height: 50,
                        width: 50,
                        child: Stack(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 25,
                              // child: Icon(Icons.person, color: Colors.white, size: 40),
                              child: Text(
                                selected[i]['name']
                                    .toString()
                                    .substring(0, 1)
                                    .toUpperCase(),
                                style: TextStyle(color: Colors.black),
                              ),
                              backgroundColor: avatarBgColor,
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () {
                                  print('Removed');
                                },
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 20,
                                  ),
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          childCount: 1,
        ),
      ),
    );
  }

  buildContactList(BuildContext context) {
    return SliverStickyHeader(
      sticky: false,
      header: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SizedBox(
          height: 1,
          child: Divider(color: Colors.grey),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext ctx, int i) {
            dynamic contact = contacts[i];
            return ListTile(
              onTap: () {
                selected.add({
                  "id": contact['id'],
                  "name": contact['name'],
                  "time": contact['time'],
                });
                print('contact ' + contact.toString() + ' added');
                print(selected.toString());
              },
              leading: CircleAvatar(
                child: Icon(Icons.person, color: Colors.white, size: 40),
                radius: 25,
                backgroundColor: avatarBgColor,
              ),
              title: Text(
                contacts[i]['name'],
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              subtitle: Text(
                'Today at, ' + contacts[i]['time'],
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            );
          },
          childCount: contacts.length,
        ),
      ),
    );
  }
}
