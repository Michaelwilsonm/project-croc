import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        DrawerHeader(
          child: Column(
            children: <Widget>[Icon(Icons.icecream), Text("Users name")],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.orange[200],
                  Colors.orange[300],
                  Colors.orange[400],
                  Colors.orange[500],
                ],
                stops: [
                  0.1,
                  0.4,
                  0.7,
                  0.9
                ]),
          ),
        ),
        ListTile(
          title: Text('Logout'),
          onTap: () {},
        ),
      ]),
    );
  }
}
