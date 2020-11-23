import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/services/auth.dart';

class Login extends StatefulWidget {
  final onLogin;

  Login({@required this.onLogin});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login>{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final auth = Authentication();

  void handleLogin() async {
    log('login -> $emailController.text');

    final user = await auth.login(emailController.text, passwordController.text);

    if(user != null){
      widget.onLogin(user);
      Navigator.pushReplacementNamed(context, '/list');
    }
    else{
      _showLoginFailed();
    }
  }

  void _showLoginFailed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Erro ao efetuar login'),
          content: new Text('Verifique suas credencias e tente novamente'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                }
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Efetuar login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha'
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                onPressed: handleLogin,
                child: Text('Login'),
                color: ThemeData().primaryColor,
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ),
    );
  }
}