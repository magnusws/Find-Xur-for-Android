import 'package:find_xur/item_perk_list.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:find_xur/models/global.dart' as global;
import 'package:find_xur/models/exotic_item.dart';
import 'package:find_xur/models/exotics.dart';
import 'package:find_xur/item_stats_view.dart';

// ITEM DETAIL VIEW
class ItemDetailView extends StatelessWidget {
  // Item list
  final ExoticItem item;
  final Perks perks;

  // Text styles
  final _titleStyle = TextStyle(
      fontSize: 26,
      color: Colors.white,
      letterSpacing: 1,
      fontFamily: 'Product Sans',
      fontWeight: FontWeight.w700);

  final _subHeadingStyle = TextStyle(
      fontSize: 17,
      color: Colors.white,
      letterSpacing: 6,
      fontFamily: 'Product Sans',
      fontWeight: FontWeight.w400);

  final _itemTypeStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    letterSpacing: 1,
  );

  final _descriptionStyle =
      TextStyle(fontSize: 14, color: Colors.grey, fontStyle: FontStyle.italic);

  // Constructor
  ItemDetailView(this.item, this.perks);

  @override
  Widget build(BuildContext context) {
    int armourElementSocketCategoryHash = 760375309;

    Map<int, int> armourDamageTypeDict = {
      0: 1,
      4248210736: 2,
      2248916764: 3,
      4197017647: 4,
    };

    Map<int, String> ammoTypeIconNameDict = {
      1: "primaryAmmoIcon.png",
      2: "specialAmmoIcon.png",
      3: "heavyAmmoIcon.png",
    };

    Map<int, String> damageTypeIconNameDict = {
      0: "unknownDamageTypeIcon.png",
      1: "kineticDamageTypeIcon.png",
      2: "arcDamageTypeIcon.png",
      3: "solarDamageTypeIcon.png",
      4: "voidDamageTypeIcon.png",
    };

    bool _isWeapon = false;
    int _damageType = 0;
    int _ammoType = 0;
    String _ammoTypeIcon;

    // Hvis item er class item
    if (item.classType < 3) {
      // init var for socket indexer
      List<int> socketIndexes = [];
      // init var for burn type hash
      var hash = 0;

      // for kategori i socket kategorier
      for (SocketCategory category in item.sockets.socketCategories) {
        // hvis category hash er lik element socket hash
        if (category.socketCategoryHash == armourElementSocketCategoryHash) {
          // henter ut index
          socketIndexes = category.socketIndexes;
        }
      }
      // henter ut hash i index som den skal finnes i
      hash = item.sockets.socketEntries[socketIndexes[0]].singleInitialItemHash;

      // Av en eller annen grunn er noen item sine verdier i index - 1 mens andre i index..
      if (armourDamageTypeDict[hash] == null) {
        hash = item.sockets.socketEntries[(socketIndexes[0] - 1)]
            .singleInitialItemHash;
      }

      // hvis det var en hash i indexen
      if (hash != 0) {
        // damage type får verdi fra dict ved bruk av hash
        _damageType =
            armourDamageTypeDict[hash] == null ? 0 : armourDamageTypeDict[hash];
      }

      // Hvis item er våpen
    } else {
      _isWeapon = true;
      _ammoType = item.equippingBlock.ammoType == null
          ? 1
          : item.equippingBlock.ammoType;
      _damageType = item.defaultDamageType == null ? 1 : item.defaultDamageType;
      _ammoTypeIcon = ammoTypeIconNameDict[_ammoType] == null
          ? 'primaryAmmoIcon.png'
          : ammoTypeIconNameDict[_ammoType];
    }

    // _titleView -> Yellow title banner with item name,
    // item type and element(Void/arc/solar).
    final Widget _titleView = Container(
        color: Color.fromRGBO(238, 188, 6, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: 320,
              margin: EdgeInsets.fromLTRB(16, 10, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        item.displayProperties.name,
                        style: _titleStyle,
                      ),
                    ),
                  ),
                  Text(item.itemTypeAndTierDisplayName, style: _itemTypeStyle),
                ],
              ),
            ),

            // Element icon -> Solar, Void, Arc
            Container(
              height: 60,
              width: 60,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                child: Container(
                  width: 54,
                  height: 54,
                  decoration: new BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: AssetImage(("assets/images/icons/" +
                            damageTypeIconNameDict[_damageType])),
                        fit: BoxFit.scaleDown),
                  ),
                ),
              ),
            ),
          ],
        ));

    // _screenshotView
    final Widget _screenshotView = Container(
      height: 300,
      // Henter og cacher item screenshot fra bungie.net
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: item.screenshot,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  alignment: Alignment.topRight,
                ),
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Container(
              alignment: Alignment.center,
              height: 300,
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                strokeWidth: 3,
              ),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
          _isWeapon
              ? Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.all(10.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/icons/" + _ammoTypeIcon),
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                  ),
                )
              : Container(),
        ],
      ),
    );

    // Custom Scroll View ---------------------------------------------

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 354,
          pinned: true,
          floating: false,
          elevation: 2.0,
          forceElevated: true,
          backgroundColor: Color.fromRGBO(238, 188, 6, 1.0),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Stack(
              children: <Widget>[
                // Screenshot
                _screenshotView,

                // Title, item type, and element
                Container(
                  margin: EdgeInsets.fromLTRB(0, 300, 0, 0),
                  child: _titleView,
                ),
              ],
            ),
          ),
        ),

        // Description / lore -------------

        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                alignment: Alignment.center,
                color: Colors.black,
                child: Scaffold(
                  backgroundColor: Colors.black,
                  body: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    color: Colors.black,
                    margin: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 0.0),
                    child: Text(
                      item.displayProperties.description,
                      style: _descriptionStyle,
                      maxLines: 3,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.white38,
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 36,
                alignment: Alignment.center,
                child: Scaffold(
                  backgroundColor: Colors.black,
                  body: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 2.0),
                        child: Text(
                          item.itemType == 3 ? 'WEAPON STATS' : 'GEAR STATS',
                          style: _subHeadingStyle,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Stats ----------------------------
        // Regular stats
        ItemStatsView(item: item), // SliverList

        // Spacer if weapon (mhm it's a hack..)
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Container(
                height: item.itemType == 3 ? 10 : 0,
                color: Colors.black,
              ),
            ],
          ),
        ),

        // Hidden stats
        HiddenItemStatsView(item: item), // SliverList

        // Spacer if weapon (mhm it's a hack..)
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Container(
                color: Colors.black,
                child: Divider(
                  color: Colors.white38,
                  height: 30,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 36,
                alignment: Alignment.center,
                child: Scaffold(
                  backgroundColor: Colors.black,
                  body: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 2.0),
                        child: Text(
                          item.itemType == 3
                              ? 'WEAPON PERKS'
                              : 'INTRINSIC PERK',
                          style: _subHeadingStyle,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Perk(s) -----------------------
        ItemPerks(item: item, perks: perks),
      ],
    );
  }
}
