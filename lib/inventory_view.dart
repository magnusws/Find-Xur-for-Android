import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'inventory_content_view.dart';
import 'models/exotics.dart';

class InventoryView extends StatelessWidget {
  final DocumentSnapshot document;
  final Perks perks;

  InventoryView(this.document, this.perks);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.black,
      child: Center(
        child: document['locationId'] != 0 && document['locationId'] != 10 ? 
          InventoryViewHere(perks: perks) : InventoryViewGone(),
      )
    );
  }
}