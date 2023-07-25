import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/contact.dart';
import '../services/prefs.dart';
import 'homeScreen.dart';

class AddContact extends StatelessWidget {
  static const String routeName = '/addContact';
  Contact? contact;
  //final int index;
  // AddContact({required this.index, this.contact, super.key});
  AddContact({this.contact, super.key});

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Contact newContact =
        contact ?? Contact(id: -1, name: '', phoneNumber: '', email: '');

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                initialValue: newContact.name,
                maxLength: 20,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9']"))
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
                maxLength: 15,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[+ 0-9]'))
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
                maxLength: 35,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-z 0-9 . @]"))
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
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        await addContact(newContact);
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
      ),
    );
  }
}