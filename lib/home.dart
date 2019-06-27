import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contact.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    createProfileImage(Contact contact) =>
        Hero(
            tag: contact.contactName,
            child: Column(children: <Widget>[
              Material(
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, 'contactdetails/${contact.contactName}');
                    },
                    child:Container(child:Column(children: <Widget>[
                      Container(
                        width: 100,
                        height: 80,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  contact.contactImage),
                            )
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                              contact.contactName,
                              style: TextStyle(color: Colors.black, fontSize: 18.0)),
                        ),
                      ),
                    ],),)
                ),
              ),

            ],)
        );
    final ProfileGrid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.only(top: 8.0),
          sliver: SliverGrid.count(
            childAspectRatio: 1,
            crossAxisCount: 3,
            mainAxisSpacing: 2.0,
            children: contacts.map((contact) => createProfileImage(contact)).toList(),
          ),
        )
      ],
    );

    ProfileList(Contact contact) =>
        Hero(
          tag: contact.contactName,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 80,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                contact.contactImage),
                          )
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, 'contactdetails/${contact.contactName}');
                        },
                      ),
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          contact.contactName,
                          style: TextStyle(
                              color: Colors.black, fontSize: 24.0)),
                    ),
                  ),

                ],),
              ),
            ),
          ),
        );

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(FontAwesomeIcons.bars,
              color: Colors.white,
            ),
            title: Text("Address Book"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(FontAwesomeIcons.solidAddressBook), onPressed: () {
                //
              }),
            ],
            bottom: TabBar(
              tabs: [
                Tab(child: Text(
                    'FAVORITES', style: TextStyle(color: Colors.white)),),
                Tab(child: Text('ALL', style: TextStyle(color: Colors.white)),),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                  child: ProfileGrid,
                ),
              ),
              Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: contacts.map((contact) => ProfileList(contact))
                      .toList(),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(FontAwesomeIcons.plus,
              color: Colors.white,
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFFED1D7F),
          ),
        ),
      ),
    );
  }
}