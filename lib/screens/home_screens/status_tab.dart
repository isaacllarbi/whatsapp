import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/strings.dart';

class StatusTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(FontAwesome.camera, color: Colors.white),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          buildMyStatusTile(context),
          buildRecentStatus(context),
          buildViewedStatus(context),
          buildMutedStatus(context),
        ],
      ),
    );
  }

  buildMyStatusTile(BuildContext context) {
    return SliverStickyHeader(
      sticky: false,
      header: SizedBox.shrink(),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext ctx, int i) {
            return buildAddStatus(context);
          },
          childCount: 1,
        ),
      ),
    );
  }

  buildAddStatus(BuildContext context) {
    return ListTile(
      onTap: () {
        print('my status tile');
      },
      leading: Stack(
        children: <Widget>[
          CircleAvatar(
            child: Icon(Icons.person, color: Colors.white, size: 40),
            backgroundColor: avatarBgColor,
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: CircleAvatar(
              child: Icon(Icons.add, color: Colors.white, size: 16),
              radius: 10,
              backgroundColor: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
      title: Text(
        my_status_text,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      subtitle: Text(tap_to_add_status_text),
    );
  }

  buildHeader(String titleText) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
      height: 30,
      width: double.infinity,
      color: Colors.grey.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            titleText,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }

  buildRecentStatus(BuildContext context) {
    return SliverStickyHeader(
      sticky: false,
      header: buildHeader(recent_updates_text),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext ctx, int i) {
            return buildStatusItem(context);
          },
          childCount: 8,
        ),
      ),
    );
  }

  buildViewedStatus(BuildContext context) {
    return SliverStickyHeader(
      sticky: false,
      header: buildHeader(viewed_updates_text),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext ctx, int i) {
          return buildStatusItem(context);
        }, childCount: 8),
      ),
    );
  }

  buildMutedStatus(BuildContext context) {
    return SliverStickyHeader(
      sticky: false,
      header: buildHeader(muted_updates_text),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext ctx, int i) {
          return buildStatusItem(context);
        }, childCount: 8),
      ),
    );
  }

  buildStatusItem(BuildContext context) {
    return ListTile(
      onTap: () {
        print('status item clicked');
      },
      leading: CircleAvatar(
        child: Icon(Icons.person, color: Colors.white, size: 40),
        radius: 25,
        backgroundColor: avatarBgColor,
      ),
      title: Text(
        faker.person.firstName() + ' ' + faker.person.lastName(),
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      subtitle: Text(
        'Today at, ' + faker.date.time().toString(),
        style: TextStyle(color: Colors.black.withOpacity(0.5)),
      ),
    );
  }
}
