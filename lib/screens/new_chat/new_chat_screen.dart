import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'components/appbar.dart';

class NewChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newChatAppbar(),
    );
  }
}
