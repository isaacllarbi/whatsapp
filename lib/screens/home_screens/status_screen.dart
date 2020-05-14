import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/strings.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('Recent Updates'),
          backgroundColor: primaryColorDark,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Icon(Icons.headset_mic),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              color: Colors.red,
              height: 150.0,
            ),
            Container(
              color: Colors.purple,
              height: 150.0,
            ),
            Container(
              color: Colors.green,
              height: 150.0,
            ),
          ]),
        ),
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
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext ctx, int i) {
            return Container(
              height: 100,
              color: Colors.red.shade400,
              margin: EdgeInsets.only(top: 5),
            );
          }, childCount: 3),
        ),
      ],
    );
  }
}
