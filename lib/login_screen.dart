import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_croc/config/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'authentication/authentication_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Email', style: labelStyle),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: inputBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.email, color: Colors.black),
              hintText: 'Enter your Email',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Password', style: labelStyle),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: inputBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.lock, color: Colors.white),
              hintText: 'Enter your Password',
              hintStyle: hintTextStyle,
            ),
            onSubmitted: (value) async => await _submit(),
          ),
        ),
      ],
    );
  }

  Widget _signInButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 40.0,
          child: ElevatedButton(
            child: _isLoading ? CircularProgressIndicator() : Text("Login"),
            onPressed: () => _submit(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
                fontSize: 40.0,
              ),
            ),
            SizedBox(height: 20.0),
            _buildEmailField(),
            SizedBox(height: 20.0),
            _buildPasswordField(),
            SizedBox(height: 20.0),
            _signInButton(context),
          ],
        ),
      ),
    );
  }

  _setIsLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  _submit() async {
    _setIsLoading(true);

    await context
        .read<AuthenticationService>()
        .signIn(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        )
        .then((onSuccess) {
      _setIsLoading(false);
    }).catchError((e) {
      _setIsLoading(false);
      _showErrorDialog(e);
    });
  }

  void _showErrorDialog(String err) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text(err),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
