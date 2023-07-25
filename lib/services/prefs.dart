import 'package:shared_preferences/shared_preferences.dart';

import '../models/contact.dart';

Future<void> addContact(Contact contact) async {
  // Obtain shared preferences.
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = contact.id != -1 ? contact.id : (prefs.getInt('counter') ?? 0);
  await prefs.setString('name' + counter.toString(), contact.name);
  await prefs.setString('number' + counter.toString(), contact.phoneNumber);
  await prefs.setString('email' + counter.toString(), contact.email);
  await prefs.setBool('isActive' + counter.toString(), true);
  if (contact.id == -1) await prefs.setInt('counter', counter + 1);
}

Future<List<Contact>> getContacts() async {
  //await Future.delayed(Duration(seconds: 2));
  // Obtain shared preferences.
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = prefs.getInt('counter') ?? 0;
  List<Contact> contacts = [];
  for (int i = 0; i < counter; i++) {
    bool? isActive = prefs.getBool('isActive' + i.toString());
    if (isActive == null) continue;

    if (!isActive) {
      await prefs.remove('name' + counter.toString());
      await prefs.remove('number' + counter.toString());
      await prefs.remove(
        'email' + counter.toString(),
      );
      await prefs.remove('isActive' + counter.toString());
      continue;
    }

    contacts.add(Contact(
        id: i,
        name: prefs.getString('name' + i.toString())!,
        phoneNumber: prefs.getString('number' + i.toString())!,
        email: prefs.getString('email' + i.toString())!));
  }
  return contacts;
}

Future<void> deleteContact(int id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isActive' + id.toString(), false);
}
