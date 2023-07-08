import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../data.dart';
import '../models/contact.dart';
import 'homeScreen.dart';

class AddContact extends StatelessWidget {
  static const String routeName = '/addContact';
  final int index;
  AddContact({required this.index, super.key});

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Contact newContact = index == -1
        ? Contact(name: '', phoneNumber: '', email: '')
        : contacts[index];

    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              initialValue: newContact.name,
              maxLength: 15,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-z A-Z G' g']"))
              ],
              decoration: InputDecoration(
                labelText: 'Enter name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2)
                  return 'Please enter name';

                newContact.name = value;

                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: newContact.phoneNumber,
              maxLength: 13,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
              decoration: InputDecoration(
                labelText: 'Enter phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please enter valid phone number';

                newContact.phoneNumber = value;
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: newContact.email,
              maxLength: 20,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-z 0-9]'))
              ],
              decoration: InputDecoration(
                labelText: 'Enter email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please enter valid email';
                newContact.email = value;
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      if (index == -1) {
                        contacts.add(newContact);
                      } else {
                        contacts[index] = newContact;
                      }
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomePage.routeName, (route) => false);
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
