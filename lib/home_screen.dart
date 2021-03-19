import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'authentication_service.dart';
import 'main_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 20,
        title: Text("Croc Shack"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Sign out"),
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
