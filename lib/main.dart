import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'file:///C:/src/flutter_apps/flutter_shopping_list/lib/services/auth.dart';
import 'package:flutter_shopping_list/model/item.dart';
import 'package:flutter_shopping_list/pages/create.dart';
import 'package:flutter_shopping_list/pages/list.dart';
import 'package:flutter_shopping_list/pages/login.dart';

void main() => runApp(ShoppingListApp());

class ShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShoppingList();
  }
}

class ShoppingList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShoppingListState();
  }
}

class ShoppingListState extends State<ShoppingList> {
  final List<Item> tasks = [];

  void onTaskCreated(String name) {
    setState(() {
      tasks.add(Item(name));
    });
  }

  void onTaskToggled(Item task) {
    setState(() {
      task.setCompleted(!task.isCompleted());
    });
  }

  final Authentication auth = new Authentication();
  FirebaseUser firebaseUser;

  void handleLogin(FirebaseUser firebaseUser) {
    setState(() {
      this.firebaseUser = firebaseUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de compras',
      initialRoute: '/',
      routes: {
        '/': (context) => Login(onLogin: handleLogin),
        '/list': (context) => ShoopingItemList(),
        '/create': (context) => ShoppingItemCreate(),
      },
    );
  }
}
