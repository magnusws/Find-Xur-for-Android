import 'package:flutter/material.dart';

import 'item_list.dart';
import 'models/exotics.dart';

import 'package:find_xur/theme.dart';

class ExoticsView extends StatelessWidget {
  final Exotics items;
  final Perks perks;

  // constructor
  ExoticsView(this.items, this.perks);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kXurTheme,
      debugShowCheckedModeBanner: false,

      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            bottom: TabBar(
              unselectedLabelColor: Colors.white38,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2.0, 
                    color: Colors.white,
                  ),
                ),
              ),
              tabs: [
                Tab(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('', style: TextStyle(fontFamily: 'Destiny Icons', fontSize: 20)),
                    ),
                ),
                Tab(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('', style: TextStyle(fontFamily: 'Destiny Icons', fontSize: 22)),
                    ),
                ),
                Tab(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('', style: TextStyle(fontFamily: 'Destiny Icons', fontSize: 22)),
                    ),
                ),
                Tab(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('', style: TextStyle(fontFamily: 'Destiny Icons', fontSize: 34)),
                  ),
                ),
              ],
            ),
            title: Text('POSSIBLE EXOTICS', style: TextStyle(fontFamily: 'Product Sans', fontWeight: FontWeight.bold, fontSize: 26, letterSpacing: 0.4)),
            backgroundColor: Colors.black,
          ),
          body: TabBarView(
            children: [
              ItemList(this.items.weapons, perks, false),
              ItemList(this.items.titan, perks, false),
              ItemList(this.items.hunter, perks, false),
              ItemList(this.items.warlock,perks, false),
            ],
          ),
        ),
      ),
    );
  }
}