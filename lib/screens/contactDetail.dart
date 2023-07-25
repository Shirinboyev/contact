import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/contact.dart';
import '../services/prefs.dart';
import 'addContact.dart';

class ContactDetail extends StatelessWidget {
  static const String routeName = '/contactDetail';
  final Contact contact;
  //final int index;

  //ContactDetail(this.contact, this.index, {super.key});
  ContactDetail(this.contact, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddContact.routeName,
                        arguments: contact
                        // {
                        //   'contact': contact,
                        //   'index': index,
                        // }
                        );
                  },
                  icon: Icon(Icons.edit)),
              label: 'Edit'),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () async {
                    await deleteContact(contact.id);
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, HomePage.routeName, (route) => false);
                    Navigator.pop(context, 5);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              label: 'Delete')
        ],
      ),
      body: Stack(children: [
        Container(
          width: double.infinity,
          color: Color.fromARGB(255, 234, 232, 232),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      contact.name,
                      style: TextStyle(fontSize: 35),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Telefon: '),
                        Text(contact.phoneNumber),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('email: '),
                        Text(contact.email),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () async {
                              final Uri callphone = Uri(
                                scheme: 'tel',
                                path: contact.phoneNumber,
                              );
                              if (await canLaunchUrl(callphone)) {
                                launchUrl(callphone);
                              }
                              // launchUrl(callphone);
                            },
                            icon: Icon(
                              Icons.phone,
                              color: Colors.green,
                            )),
                        IconButton(
                            onPressed: () async {
                              final Uri smsPage =
                                  Uri(scheme: 'sms', path: contact.phoneNumber);
                              if (await canLaunchUrl(smsPage)) {
                                launchUrl(smsPage);
                              }
                            },
                            icon: Icon(
                              Icons.message,
                              color: Colors.blue,
                            )),
                        IconButton(
                            onPressed: () async {
                              final Uri meetPage = Uri(
                                scheme: 'meet',
                                path: contact.phoneNumber,
                              );
                              if (await canLaunchUrl(meetPage)) {
                                launchUrl(meetPage);
                              }
                            },
                            icon: Icon(
                              Icons.missed_video_call_outlined,
                              color: Colors.blueGrey,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('WhatsApp'),
                          TextButton(
                            onPressed: () async {
                              final Uri callphone = Uri(
                                scheme: 'tel',
                                path: contact.phoneNumber,
                              );
                              if (await canLaunchUrl(callphone)) {
                                launchUrl(callphone);
                              }
                              // launchUrl(callphone);
                            },
                            child: CircleAvatar(
                              radius: 14,
                              backgroundImage:
                                  AssetImage('images/whatsApp.png'),
                            ),
                          )
                        ],
                      ),
                      Container(
                        color: Colors.grey,
                        height: 1,
                        width: double.infinity,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Telegram'),
                          CircleAvatar(
                            radius: 14,
                            backgroundImage: AssetImage('images/telegram.png'),
                          )
                        ],
                      )
                    ]),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
