import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppToolBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orangeAccent,
      elevation: 20,
      title: Text("Croc Shack"),
    );
  }

  @override
  get preferredSize => Size.fromHeight(kToolbarHeight);
}
