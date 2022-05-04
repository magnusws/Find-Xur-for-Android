import 'dart:async';
import 'package:flutter/material.dart';

import 'item_list.dart';
import 'models/inventory.dart';
import 'models/exotic_item.dart';
import 'models/exotics.dart';
import 'animated_list_placeholder.dart';

/*------------- HERE --------------*/
List<ExoticItem> fetchedItems;
// InventoryViewHere ---------------------------------------------------

class InventoryViewHere extends StatefulWidget {
  InventoryViewHere({Key key, this.perks}) : super(key: key);
  final Perks perks;

  @override
  _InventoryViewHereState createState() => _InventoryViewHereState(perks: perks);
}

class _InventoryViewHereState extends State<InventoryViewHere> {
  _InventoryViewHereState ({this.perks});
  Future<List<ExoticItem>> inventoryItems;
  Perks perks;

  @override
  void initState() {
    super.initState();
    inventoryItems = fetchInventory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('INVENTORY',
              style: TextStyle(
                  fontFamily: 'Product Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  letterSpacing: 0.4)),
          backgroundColor: Colors.black,
        ),
        // Body
        body: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: <Widget>[
                // Exotic Engram View
                EngramView(),
                // Inventory List
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 2),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 400,
                  child: FutureBuilder<List<ExoticItem>>(
                    future: this.inventoryItems,
                    builder: (context, inventorySnapshot) {
                      if (inventorySnapshot.hasData) {
                        return ItemList(inventorySnapshot.data, perks, true);
                      } else if (inventorySnapshot.hasError) {
                        return Text("${inventorySnapshot.error}");
                      }

                      return AnimatedListPLaceholder();
/*
                      // By default, show a loading spinner.
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0, 40, 0, 50),
                        height: 260,
                        child: Lottie.asset(
                          'assets/listLoadingAnimation.json',
                          width: 260,
                          height: 260,
                          fit: BoxFit.cover,
                        ),
                      );

                      */
                    },
                  ),
                )
              ],
            )));
  }
}

// EngramView --------------------------------------------------------------

class EngramView extends StatelessWidget {
  // Text styles
  final _titleStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontFamily: 'Product Sans',
    fontWeight: FontWeight.w600,
  );

  final _subtitleStyle = TextStyle(fontSize: 15, color: Colors.grey);

  final _priceStyle =
      TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // Engram icon
        Container(
          margin: EdgeInsets.fromLTRB(20, 8, 10, 0),
          child: Image(
              image: AssetImage("assets/images/icons/exotic-engram.png"),
              width: 84,
              height: 84),
        ),
        // Title and description
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Exotic Engram',
              style: _titleStyle,
              textAlign: TextAlign.left,
              maxLines: 2,
            ),
            Text('Contains a new exotic if any\nremain to be collected.',
                style: _subtitleStyle, textAlign: TextAlign.left),
          ],
        ),
        // Lightning Shard icon and price
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Image(
                  image: AssetImage("assets/images/materialIcons/ls.png"),
                  width: 26,
                  height: 26),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
              child: Text('97', style: _priceStyle, textAlign: TextAlign.left),
            )
          ],
        )
      ],
    ));
  }
}

/*------------- GONE --------------*/

class InventoryViewGone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('INVENTORY',
              style: TextStyle(
                  fontFamily: 'Product Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  letterSpacing: 0.4)),
          backgroundColor: Colors.black,
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: Column(children: <Widget>[
            Image(image: AssetImage('assets/images/ix-illu.png')),
            Text(
              'Xur is currently not in our galaxy.',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
              textScaleFactor: 0.8,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Text(
                  'He will arrive again next friday after reset, \nselling you some precious exotic loot.',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ))
          ]),
        ));
  }
}
