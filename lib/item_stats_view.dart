//
//
// This file contains both ItemStatsView() and HiddenItemStatsView()
// Created 18/06/2020 by Magnus Walberg Solbakken.
//
//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:find_xur/models/global.dart' as global;
import 'package:find_xur/models/exotic_item.dart';



// ITEM STATS VIEW
class ItemStatsView extends StatelessWidget {
  final ExoticItem item;

  ItemStatsView({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _defaultStyle = TextStyle(
      fontSize: 16, color: Colors.white, 
      //fontWeight: FontWeight.w800
      );

    final _statNameStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w800,
    );

    // HVIS WEAPON STATS -----------------------------------------------
    if (item.itemType == 3) {
      
      return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          List<Stat> _stats = item.getStats(item.itemSubType);
          Stat _stat = _stats[index];
          
          bool _isNumerical = false;

          global.numericalWeaponStats.forEach((numHash) {
            if (numHash == _stat.statHash) {
              _isNumerical = true;
            }
          });

          final Widget _linearStatIndicator = Container(
            alignment: Alignment.centerLeft,
            height: 28,
            width: MediaQuery.of(context).size.width * 0.52,
            margin: EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
            child: LinearPercentIndicator(

              percent: _isNumerical ? 10/100 : (_stat.value.toDouble() / 100), // ??? Faar feilmelding om jeg ikke legger til denne hacken..
              backgroundColor: Colors.white24,
              progressColor: Colors.white,
              lineHeight: 14.0,
            ),
          );

          final Widget _emptyContainer = Container();

          return Container(
            width: MediaQuery.of(context).size.width,
            height: 28,
            alignment: Alignment.topCenter,
            child: Scaffold(
              body: Container(
                  margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      _isNumerical ? Text(global.weaponStatName[_stat.statHash] + ':',
                            style: _statNameStyle) : Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(global.weaponStatName[_stat.statHash],
                            style: _statNameStyle),
                    ),
                      ),
                      _isNumerical ? _emptyContainer : _linearStatIndicator,
                      Text(' ' + _stat.value.toString(), style: _defaultStyle),
                    ],
                  )),
            ),
          );
        }, childCount: item.statCount(item.itemSubType)),
      );
    } // End weapon stat

    // HVIS GEAR STATS --------------------------------------------------
    int _total = 0;
    item.stats.stats.forEach((key,stat) {
      _total += stat.value;
    });

    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        List<Stat> _stats = item.getGearStats();
        var nrOfItems = item.gearStatCount();
        
        // Linear stat indicator Widget
        final Widget _linearStatIndicator = Container(
            alignment: Alignment.centerRight,
            height: 28,
            width: MediaQuery.of(context).size.width * 0.50,
            margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: LinearPercentIndicator(

              percent: index < (nrOfItems) ? (_stats[index].value.toDouble() / 50) : 10/50, // ??? Faar feilmelding om jeg ikke legger til denne hacken..
              backgroundColor: Colors.white24,
              progressColor: Colors.white,
              lineHeight: 14.0,
            ),
          );

        // if not last index
        if (index < nrOfItems) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 28,
            alignment: Alignment.topCenter,
            child: Scaffold(
              body: Container(
                  margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Text(global.destinyStatName[_stats[index].statHash] + ':',
                          style: _statNameStyle),
                      ),
                      _linearStatIndicator,
                      Text('+' + _stats[index].value.toString(),
                          style: _defaultStyle),
                    ],
                  )),
            ),
          );
        }

        // If last index -> return total stat score
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 28,
          alignment: Alignment.topCenter,
          child: Scaffold(
            body: Container(
                margin: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 0.0),
                alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget>[
                    Text('Total', style: _statNameStyle),
                    Text(': ' + _total.toString(), style: _defaultStyle),
                  ],
                )),
          ),
        );

      }, 
      // childCount = number of stats plus one extra row that displays total stat score
      childCount: item.gearStatCount()+1,
      ),
    );
  }
}


// HIDDEN ITEM STATS VIEW
class HiddenItemStatsView extends StatelessWidget {
  final ExoticItem item;

  HiddenItemStatsView({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _defaultStyle = TextStyle(
      fontSize: 16, 
      color: Colors.grey, 
      //fontWeight: FontWeight.w800,
      );

    final _statNameStyle = TextStyle(
        fontSize: 16,
        color: Colors.grey,
        fontWeight: FontWeight.w800,
    );

    // HVIS WEAPON STATS -----------------------------------------------
    if (item.itemType == 3) {

      List<Stat> _hiddenStats = item.getHiddenStats();
      
      return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {

          final Widget _linearStatIndicator = Container(
            alignment: Alignment.centerLeft,
            height: 28,
            width: MediaQuery.of(context).size.width * 0.52,
            margin: EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
            child: LinearPercentIndicator(

              percent: _hiddenStats[index].value.toDouble() == null ? 10/100 : (_hiddenStats[index].value.toDouble() / 100), 
              backgroundColor: Colors.white24,
              progressColor: Colors.white54,
              lineHeight: 14.0,
            ),
          );

          return Container(
            width: MediaQuery.of(context).size.width,
            height: 28,
            alignment: Alignment.topCenter,
            child: Scaffold(
              body: Container(
                  margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(global.weaponStatName[_hiddenStats[index].statHash],
                            style: _statNameStyle),
                    ),
                      ),
                      _linearStatIndicator,
                      Text(' ' + _hiddenStats[index].value.toString(), style: _defaultStyle),
                    ],
                  )),
            ),
          );
        }, childCount: _hiddenStats.length),
      );
    } // End weapon stat

    // HVIS GEAR STATS --------------------------------------------------
    // finnes ingen hidden stats, returnerer tom container
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {

        // If last index -> return total stat score
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          alignment: Alignment.topCenter,
          child: Scaffold(
            body: Container(),
          ),
        );

      }, 
      // childCount = number of stats plus one extra row that displays total stat score
      childCount: 0
      ),
    );
  }
}
