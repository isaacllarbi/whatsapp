import 'package:flutter/material.dart';
import 'package:whatsapp/components/action_button.dart';

import '../../../colors.dart';

 AppBar newChatAppbar() {
    return AppBar(
      backgroundColor: primColorDark,
      title: ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text(
          'Select contact',
          style: TextStyle(color: Colors.white, fontSize: 19.5),
        ),
        subtitle: Text(
          '986 contacts',
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
      actions: [
        ActionButton(
          icon: Icons.search,
          onPressed: (){},
        )
      ],
    );
  }