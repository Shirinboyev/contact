import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../data.dart';
import 'addContact.dart';

class ContactDetail extends StatelessWidget {
  static const String routeName = '/contactDetail';
  int index;
  int ind = 0;
  ContactDetail(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddContact.routeName,
                      arguments: index);
                },
                icon: Icon(Icons.edit)),
            label: 'Tahrirlash',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: 'ulashish'),
          BottomNavigationBarItem(icon: Icon(Icons.block), label: 'block'),
        ],
        currentIndex: ind,
        onTap: (index) {},
      ),
      backgroundColor: Color.fromARGB(255, 237, 235, 235),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            height: 230,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  contacts[index].name,
                  style: TextStyle(fontSize: 40),
                ),
                Center(
                  child: Row(
                    children: [
                      Text('Telefon: '),
                      Text(contacts[index].phoneNumber),
                    ],
                  ),
                ),
                Text(contacts[index].email),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
