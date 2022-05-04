import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:find_xur/models/global.dart' as global;
import 'package:find_xur/planet_view.dart';
import 'package:find_xur/galaxy.dart';
import 'package:find_xur/countdown_view.dart';
import 'package:find_xur/time.dart';

class LocationView extends StatelessWidget {
  final DocumentSnapshot document;

  final Map<int, String> mapImageName = {
    1: "assets/images/mapTower.jpg", 
    2: "assets/images/mapEDZ.jpg", 
    3: "assets/images/mapIO.jpg", 
    4: "assets/images/mapTitan.jpg", 
    5: "assets/images/mapNessus.jpg",
  };

  final Map<int, String> mapLocationTitle = {
    0: "One moment please..",
    1: "Hangar, The Last City",
    2: "Winding Cove, EDZ",
    3: "Giant's Scar, Echo Mesa",
    4: "The Rig, New Pacific Arcology",
    5: "The Barge, Watcher's Grave",
    10: "Xur has left.",
  };

  final Map<int, String> mapGuideText = {
    0: "Xur arrived moments ago. Please wait while we verify his location this weekend in D2.",
    1: "This weekend in Destiny 2 Xur is standing behind Dead Orbit in the Tower Hangar.",
    2: "This weekend in Destiny 2 Xur is standing high up on a ledge in Winding cove in the EDZ.",
    3: "This weekend in Destiny 2 Xur is standing in a cave at Giant's Scar on IO.",
    4: "This weekend in D2 Xur is standing in a building near the dock at The Rig on Titan.",
    5: "This weekend in D2 Xur is standing on board the barge at Watchers Grave on Nessus.",
    10: "Xur will arrive again next weekend.",
  };

  LocationView(this.document);

  Widget _mapView(BuildContext context) {
    return Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
          side: BorderSide(color: Colors.grey[900]),
        ),
        onPressed: () => displayBottomSheet(context),
        child: const Text('     SHOW MAP     ',
            style: TextStyle(fontSize: 16, letterSpacing: 3)),
        color: Color.fromRGBO(28, 28, 30, 1.0),
        padding: EdgeInsets.all(18),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width > 1080 ? 16 : 10
      ),
      margin: EdgeInsets.only(bottom: 14),
    );
  }

  void displayBottomSheet(BuildContext context) {
    double _padding = MediaQuery.of(context).size.width * 0.1;

    // Text styles
    final _titleStyle = TextStyle(
        fontSize: 20,
        color: Colors.white,
        letterSpacing: 1,
        height: 2,
        fontFamily: 'Product Sans',
        fontWeight: FontWeight.w600);
    final _subtitleStyle = TextStyle(
        fontSize: 14,
        color: Colors.white,
        letterSpacing: 1);

    showModalBottomSheet(
        context: context,
        backgroundColor: Color.fromRGBO(1, 1, 1, 0.0),
        builder: (ctx) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 50),
                padding: EdgeInsets.fromLTRB(_padding, 0, _padding, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Location guide title
                    Text(mapLocationTitle[document.data['locationId']], style: _titleStyle),
                    // Location guide text
                    Text(
                      mapGuideText[document.data['locationId']],
                      textAlign: TextAlign.center,
                      style: _subtitleStyle,
                      maxLines: 3,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15, color: Colors.black45, spreadRadius: 8)
                ],
                image: DecorationImage(
                  // Map image
                  image: AssetImage(mapImageName[document.data['locationId']]),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // Hvis Xur er her: galaxyBG.jpg
          decoration: this.document['locationId'] == 0 ||
                  this.document['locationId'] == 10
              ? null
              : BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/galaxyBG.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // Hvis Xur er her: 3DPlanet. Hvis ikke: Bubbles
          child: this.document['locationId'] != 0 &&
                  this.document['locationId'] != 10
              ? Planet(this.document)
              : Galaxy(),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // Hvis Xur er her: Planet skygge (.png overlay)
          decoration: this.document['locationId'] == 0 ||
                  this.document['locationId'] == 10
              ? null
              : BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/planetShadow.png"),
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Container(
          child: Text('LOCATION', style: Theme.of(context).textTheme.headline5),
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.78,
          alignment: Alignment.topLeft,
          padding:
              EdgeInsets.all(MediaQuery.of(context).size.width > 400 ? 18 : 8),
        ),
        Container(
          child: Text(
              this.document['locationId'] == 0
                  ? "VERIFYING LOCATION"
                  : global.locationName[this.document['locationId']],
              style: this.document['locationId'] <= 1 ||
                      this.document['locationId'] >= 9
                  ? Theme.of(context).textTheme.headline2
                  : Theme.of(context).textTheme.headline1),
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.72,
          alignment: Alignment.topLeft,
          padding:
              EdgeInsets.all(MediaQuery.of(context).size.width > 400 ? 16 : 10),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          // Hvis Xur er her: MapView
          child: this.document['locationId'] != 0 &&
                  this.document['locationId'] != 10
              ? _mapView(context)
              : null,
        ),
        Container(
          alignment: Alignment.center,
          child: this.document['locationId'] == 10
              ? CountdownView(
                  duration:
                      currentTimeUntilNextUpdate(this.document['nextUpdate']))
              : null,
        )
      ],
      alignment: Alignment.center,
    ));
  }
}
