import 'dart:convert';
import 'dart:async';

import 'package:flutter/services.dart';

import 'package:find_xur/models/exotic_item.dart';

class Exotics {
  List<ExoticItem> data;
  List<ExoticItem> weapons;
  List<ExoticItem> titan;
  List<ExoticItem> hunter;
  List<ExoticItem> warlock;

  // contstructor
  Exotics() {
    loadExotics();
  }

  Future loadExotics() async {
    String jsonExotics = await _loadExoticData();
    _parseJsonForExotics(jsonExotics);
  }

  Future<String> _loadExoticData() async {
    return await rootBundle.loadString('data_repo/exotics_data.json');
  }

  void _parseJsonForExotics(String jsonString) {
    List decoded = jsonDecode(jsonString);
    List<ExoticItem> tempList = [];

    decoded.forEach((element) => tempList.add(ExoticItem.fromJson(element)));

    // data => every single exotic item
    this.data = tempList;
    this.weapons = filter(3, tempList);
    this.titan = filter(0, tempList);
    this.hunter = filter(1, tempList);
    this.warlock = filter(2, tempList);

    tempList.clear();
  }

  // Func filters items by class (if no class(3) = weapon)
  List filter(int id, List items) {
    List<ExoticItem> tempList = List();
    for (ExoticItem item in items) {
      if (item.classType == id) {
        tempList.add(item);
      }
    }
    return tempList;
  }
}

class Perks {
  List<ExoticItem> definitions;

  // Constructor
  Perks() {
    loadPerks();
  }

  Future loadPerks() async {
    String jsonExotics = await _loadPerkData();
    _parseJsonForPerks(jsonExotics);
  }

  Future<String> _loadPerkData() async {
    return await rootBundle.loadString('data_repo/perks.json');
  }

  void _parseJsonForPerks(String jsonString) {
    List decoded = jsonDecode(jsonString);
    List<ExoticItem> tempList = [];

    decoded.forEach((element) => tempList.add(ExoticItem.fromJson(element)));

    this.definitions = tempList;
  }
}
