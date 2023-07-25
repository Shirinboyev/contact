import 'package:contact/services/prefs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/contact.dart';
import 'addContact.dart';
import 'contactDetail.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 198, 198),
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context, AddContact.routeName,
                  // arguments: {
                  //   'index': -1,
                  // }
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: getContacts(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Contact> contacts = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.amber),
                      ),
                      tileColor: Colors.white,
                      onTap: () {
                        Navigator.pushNamed(context, ContactDetail.routeName,
                                arguments: contacts[index]
                                //  {
                                //   'contact': contacts[index],
                                //   'index': index,
                                // }
                                )
                            .then((value) {
                          print(value);
                          setState(() {});
                        });
                      },
                      trailing: IconButton(
                          onPressed: () async {
                            final Uri callphone = Uri(
                              scheme: 'tel',
                              path: contacts[index].phoneNumber,
                            );
                            if (await canLaunchUrl(callphone)) {
                              launchUrl(callphone);
                            }
                            // launchUrl(callphone);
                          },
                          icon: Icon(
                            Icons.call,
                            color: Colors.green,
                          )),
                      leading: Text((index + 1).toString()),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              contacts[index].name,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
