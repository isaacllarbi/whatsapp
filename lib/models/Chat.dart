import 'package:flutter/foundation.dart';

class Chat {
  String id='';
  String timestamp='';
  String message='';

  Chat({
    @required String message ='',
    @required String timestamp='',
    @required String id="",
  });
}
