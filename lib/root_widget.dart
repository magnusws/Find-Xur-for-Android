import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'xur_app_icons.dart';
import 'location_view.dart';
import 'inventory_view.dart';
import 'exotics_view.dart';
import 'models/exotics.dart';

Exotics exotics = new Exotics();
Perks itemPerks = new Perks();

class RootWidget extends StatefulWidget {
  RootWidget({Key key, this.firestore}) : super(key: key);

  final Firestore firestore;

  CollectionReference get xurCollection => firestore.collection('xur');

  @override
  _RootWidgetState createState() => _RootWidgetState(firestore: firestore);
}

class _RootWidgetState extends State<RootWidget> {
  _RootWidgetState ({this.firestore});
  final Firestore firestore;

  // States
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder<QuerySnapshot>(

      stream: firestore
          .collection("xur")
          .orderBy("lastUpdate", descending: true)
          .limit(1)
          .snapshots(),

      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) { 
          return Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                      );
        }else {

        final DocumentSnapshot document = snapshot.data.documents.first;

        final _kTabPages = <Widget>[
          // Location View
          LocationView(document),
          // Inventory View
          InventoryView(document, itemPerks),
          // Exotics View
          ExoticsView(exotics, itemPerks),
        ]; 

        final _kBottomNavBarItems = <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(XurIcons.location, size: 30,), 
            title: Text('Location', style: TextStyle(letterSpacing: .4))
          ),

          BottomNavigationBarItem(
            icon: Icon(XurIcons.ix, size: 30), 
            title: Text('Inventory', style: TextStyle(letterSpacing: .4))
          ),

          BottomNavigationBarItem(
            icon: Icon(XurIcons.engram, size: 30), 
            title: Text('Exotics', style: TextStyle(letterSpacing: .4))
          ),
        ];

    return Scaffold(
      body: Center(
        child: _kTabPages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _kBottomNavBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    );
        } 
      },
    );
  }


}

