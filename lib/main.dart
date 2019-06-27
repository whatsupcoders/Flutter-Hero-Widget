import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contact.dart';
import 'contactDetails.dart';
import 'home.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFED1D7F),
      ),
      home: Home(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }

  generateRoute(RouteSettings settings) {
    final path = settings.name.split('/');
    final contactName = path[1];

    Contact contact = contacts.firstWhere((myroute) => myroute.contactName == contactName);
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => ContactDetails(contact),
    );
  }
}