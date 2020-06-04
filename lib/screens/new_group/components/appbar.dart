import 'package:flutter/material.dart';
import 'package:whatsapp/components/action_button.dart';

import '../../../strings.dart';

 AppBar newGroupAppbar() {
    return AppBar(
      title: ListTile(
        title: Text(
          new_group_text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          add_participants_text,
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