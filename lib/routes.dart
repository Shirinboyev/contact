import 'package:contact/screens/addContact.dart';
import 'package:contact/screens/contactDetail.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';
import 'screens/homeScreen.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(builder: (context) => HomePage());
    case AddContact.routeName:
      return MaterialPageRoute(
          builder: (context) => AddContact(
                contact: settings.arguments as Contact?,
                //index: (settings.arguments as Map)['index'],
                //contact: (settings.arguments as Map)['contact'],
              ));
    case ContactDetail.routeName:
      return MaterialPageRoute(
          builder: (context) => ContactDetail(settings.arguments as Contact

              // (settings.arguments as Map)['contact'],
              // (settings.arguments as Map)['index'])
              ));
    // case SecondPage.routeName:
    //   return MaterialPageRoute(
    //       builder: (context) => SecondPage(settings.arguments as int));
    // case ThirdPage.routeName:
    //   return MaterialPageRoute(builder: (context) => ThirdPage());
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(child: Text('Not found')),
              ));
  }
}
