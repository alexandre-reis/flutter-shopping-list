import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShoppingItemCreate extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ShoppingItemCreateState();
  }
}

class ShoppingItemCreateState extends State<ShoppingItemCreate> {

  final collection = Firestore.instance.collection('items');
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar item')),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                  autofocus: true,
                  controller: controller,
                  decoration: InputDecoration(
                      labelText: 'Informe a descrição do item')))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () async  {
          await collection.add({'name': controller.text, 'completed': false});
          Navigator.pop(context);
        },
      ),
    );
  }
}
