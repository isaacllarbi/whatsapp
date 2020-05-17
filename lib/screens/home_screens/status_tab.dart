import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/strings.dart';

class StatusTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('Recent Updates'),
          // backgroundColor: primaryColorDark,
          // expandedHeight: 200,
          // flexibleSpace: FlexibleSpaceBar(
          //   background: Icon(Icons.headset_mic),
          // ),
        ),
        // SliverPersistentHeader(delegate: Ss),
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext ctx, int i) {
            return Container(
              height: 100,
              color: Colors.blue.shade400,
              margin: EdgeInsets.only(top: 5),
            );
          }, childCount: 3),
        ),
        // Text('Muted Updates'),

      ],
    );
  }
}
