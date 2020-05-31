import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/strings.dart';

class StarredmessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starred Messages'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 90,
                backgroundColor: primColor,
                child: Icon(Icons.star, color: Colors.white, size: 90),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Text(
                  tap_and_hold_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
