import 'package:flutter/material.dart';

import '../data.dart';
import 'addContact.dart';
import 'contactDetail.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddContact.routeName,
                    arguments: -1);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(index.toString()),
              title: Text(contacts[index].name),
              onTap: () {
                Navigator.pushNamed(context, ContactDetail.routeName,
                    arguments: index);
              },
            );
          }),
    );
  }
}
