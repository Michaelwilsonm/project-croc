import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_croc/profile_screen.dart' '';
import 'package:provider/provider.dart';

import '../authentication/authentication_service.dart';

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
          title: Text('Croc bikes'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Account'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
        ),
        ListTile(
          title: Text('Sign out - temporary'),
          onTap: () {
            context.read<AuthenticationService>().signOut();
          },
        ),
      ]),
    );
  }
}
