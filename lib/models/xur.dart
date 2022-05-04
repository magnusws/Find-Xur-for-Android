import 'package:cloud_firestore/cloud_firestore.dart';

class Xur {
  dynamic id;
  bool isHere;
  dynamic locationId;
  dynamic inventoryId;
  Timestamp nextUpdate;
  Timestamp lastUpdate;

  // Constructor
  Xur(
    this.id, 
    this.isHere, 
    this.locationId, 
    this.inventoryId, 
    this.lastUpdate, 
    this.nextUpdate
  );

  // Constructor default values
  Xur.defautValues() {
    this.id = 0;
    this.isHere = false; 
    this.locationId = 0; 
    this.inventoryId = 0; 
    this.lastUpdate = Timestamp.fromDate(new DateTime.now());
    this.nextUpdate = Timestamp.fromDate(new DateTime.now());
  }

}
