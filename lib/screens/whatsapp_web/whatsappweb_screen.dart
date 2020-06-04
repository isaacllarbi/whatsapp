import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/strings.dart';

class WhatsappwebScreen extends StatefulWidget {
  @override
  _WhatsappwebScreenState createState() => _WhatsappwebScreenState();
}

class _WhatsappwebScreenState extends State<WhatsappwebScreen> {
  bool permissonGranted = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(scan_qr_code_text),
          ),
          body: Column(
            children: [
              Container(
                color: Colors.white,
                height: 85,
                child: Center(
                  child: Text(
                    to_use_whatsapp_web,
                    style: TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              Expanded(
                child: Container(
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ),
        permissonGranted
            ? SizedBox.shrink()
            : buildCameraPermissionDialog(context),
      ],
    );
  }

  Widget buildCameraPermissionDialog(context) {
    return ClipRect(
      child: AlertDialog(
        elevation: 100,
        contentPadding: EdgeInsets.all(0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 100,
              color: primColor,
              child: Center(
                child: Icon(Icons.camera_alt, size: 50, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 24),
              child: Center(
                child: Text(
                  to_log_in_to_whatsapp_web,
                  style: TextStyle(color: faintTextColor),
                ),
              ),
            ),
            ButtonBar(
              children: [
                FlatButton(
                  onPressed: () {
                    print('not now clicked');
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    not_now_text.toUpperCase(),
                    style: TextStyle(color: primColor),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      permissonGranted = true;
                    });
                    //TODO  dismiss dialog, request camera permission and show camera in expanded widget
                  },
                  child: Text(
                    continue_text.toUpperCase(),
                    style: TextStyle(color: primColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
