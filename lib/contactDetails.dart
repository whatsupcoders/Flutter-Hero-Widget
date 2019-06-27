import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contact.dart';

class ContactDetails extends StatelessWidget {
  final Contact contact;

  ContactDetails(this.contact);

  @override
  Widget build(BuildContext context) {
    final myImage = Hero(
      tag: contact.contactName,
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height / 2,
        decoration: new BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                  contact.contactImage),
            )
        ),
      ),
    );


    final myDetails = Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(
                          child: Icon(FontAwesomeIcons.phone,
                            color: Color(0xFFED1D7F),
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(child: Text(contact.contactPhone,
                            style: TextStyle(
                                color: Colors.black, fontSize: 22.0)),),
                      ),
                    ],)),
                ],)
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(
                          child: Icon(FontAwesomeIcons.solidEnvelope,
                            color: Color(0xFFED1D7F),
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(child: Text(contact.contactEmail,
                            style: TextStyle(
                                color: Colors.black, fontSize: 22.0)),),
                      ),
                    ],)),
                ],)
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        child: Padding
                          (
                          padding: EdgeInsets.all(8.0),
                          child: Icon(FontAwesomeIcons.slack,
                              color: Colors.white,
                              size: 35.0),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        child: Padding
                          (
                          padding: EdgeInsets.all(8.0),
                          child: Icon(FontAwesomeIcons.github,
                              color: Colors.white,
                              size: 35.0),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        child: Padding
                          (
                          padding: EdgeInsets.all(8.0),
                          child: Icon(FontAwesomeIcons.twitter,
                              color: Colors.white,
                              size: 35.0),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        child: Padding
                          (
                          padding: EdgeInsets.all(8.0),
                          child: Icon(FontAwesomeIcons.linkedin,
                              color: Colors.white,
                              size: 35.0),
                        )
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),

      ),
    );


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFED1D7F),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ), onPressed: () => Navigator.of(context).pop(),),
          title: Text(contact.contactName),
          actions: <Widget>[
            IconButton(icon: Icon(FontAwesomeIcons.pen), onPressed: () {

            }),
            IconButton(icon: Icon(FontAwesomeIcons.ellipsisV), onPressed: () {
              //
            }),
          ],
        ),
        body: Column(
          children: <Widget>[
            myImage,
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
              child: myDetails,
            ),
          ],
        ),
      ),
    );
  }
}