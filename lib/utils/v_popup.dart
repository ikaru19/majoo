import 'package:flutter/material.dart';
import 'package:majoo_test/widget/v_widget.dart';

class VPopUp {
  final BuildContext context;
  String title;
  String content;

  VPopUp(this.context, {title, content});

  void error(message, {title = "Maaf", onPressed}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (c) => AlertDialog(
              title: VText(title, color: Colors.red),
              content: VText(message),
              actions: <Widget>[
                FlatButton(
                  child: VText("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                    onPressed();
                  },
                )
              ],
            ));
  }

  Future<bool> alert(content) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (c) {
        return AlertDialog(
          title: VText("Perhatian", color: Colors.red),
          content: VText(content, color: Colors.black),
          actions: <Widget>[
            FlatButton(
              child: VText("Batalkan", color: Colors.black),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            FlatButton(
              child: VText(
                "OK",
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
            )
          ],
        );
      },
    );
  }

  void sessionEnd() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (c) => AlertDialog(
        title: VText("Sesi anda telah berakhir", color: Colors.red),
        content: VText("Coba login lagi ya"),
        actions: <Widget>[
          FlatButton(
            child: VText("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
