//
//
// This file contains both ItemStatsView() and HiddenItemStatsView()
// Created 18/06/2020 by Magnus Walberg Solbakken.
//
//

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:find_xur/models/exotic_item.dart';
import 'package:find_xur/models/exotics.dart';

// WEAPON PERKS LIST
class ItemPerks extends StatelessWidget {
  final ExoticItem item;
  final Perks perks;

  ItemPerks({Key key, @required this.item, this.perks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _descriptionStyle = TextStyle(
      fontSize: 14, color: Colors.white70,
      //fontWeight: FontWeight.w800
      height: 1.2,
    );

    final _nameStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w800,
    );

    final List<ExoticItem> _itemPerks = getPerks();

    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {

        // final Widget _name = Container(child: Text(_intrinsicPerk.name),);

        return Container(
          width: MediaQuery.of(context).size.width,
          height: 110,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
          child: Scaffold(
            backgroundColor: Colors.white12,
            
            body: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                // Perk icon
                Container(           
                  margin: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                  height: 54,
                  width: 54,
                  child: CachedNetworkImage(
                    imageUrl: 'https://www.bungie.net/common/destiny2_content/icons/' + _itemPerks[index].displayProperties.icon,

                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight,
                        ),
                      ),
                    ),

                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(
                      alignment: Alignment.center,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),

                    errorWidget: (context, url, error) => Center( 
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),

                  ),
                ),

                // Name and Description
                Container(
                  width: MediaQuery.of(context).size.width * 0.74,
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      //Text: Perk name
                      Text(
                        _itemPerks[index].displayProperties.name,
                        style: _nameStyle,
                      ),

                      //Text: Perk description
                      Text(
                        _itemPerks[index].displayProperties.description,
                        style: _descriptionStyle,
                        maxLines: 4,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }, childCount: _itemPerks.length == null ? 0 : _itemPerks.length),
    );
  }

  // Returns a list with item perks
  List<ExoticItem> getPerks() {
    List<ExoticItem> _itemPerks = new List();
    if (item.sockets.socketEntries != null) {
      item.sockets.socketEntries.forEach((element) {
        perks.definitions.forEach((perk) {
          if (element.singleInitialItemHash == perk.hash &&
              element.defaultVisible == true) {
            _itemPerks.add(perk);
          }
        });
      });
    }
    return _itemPerks;
  }
}
