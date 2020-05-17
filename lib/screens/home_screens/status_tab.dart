import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/strings.dart';

class StatusTab extends StatelessWidget { 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.camera, color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
          buildStatusHeaderRow(context),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                buildRecentStatus(context),
                buildViewedStatus(context),
                buildMutedStatus(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  SliverStickyHeader buildMutedStatus(BuildContext context) {
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

  SliverStickyHeader buildViewedStatus(BuildContext context) {
    return SliverStickyHeader(
      sticky: false,
      header: buildHeader('Viewed updates'),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext ctx, int i) {
          return buildStatusItem(context);
        }, childCount: 8),
      ),
    );
  }

  SliverStickyHeader buildRecentStatus(BuildContext context) {
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

  buildStatusHeaderRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 10, right: 5, top: 10),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              CircleAvatar(
                child: Icon(Icons.person, color: Colors.white, size: 40),
                radius: 25,
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
          Expanded(
            child: Container(
              height: 45,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      my_status_text,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Text(tap_to_add_status_text),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildStatusItem(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 10, right: 5, top: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Icon(Icons.person, color: Colors.white, size: 40),
            radius: 25,
            backgroundColor: avatarBgColor,
          ),
          Expanded(
            child: Container(
              height: 45,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      my_status_text,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Text(tap_to_add_status_text),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
}
