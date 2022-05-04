import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'exotic_item.dart';
import 'global.dart' as global;

List<String> itemHashes = ['0', '0', '0', '0'];
List<ExoticItem> inventoryItems;
DateTime _lastFetch;

Future<List<ExoticItem>> fetchInventory() async {
  var now = DateTime.now().toUtc();

  // Hvis det er mindre enn ti sekunder siden sist sjekk
  if (_lastFetch != null) {
    var difference = now.difference(_lastFetch);
    print(difference);
    if (difference.inSeconds <= 10) {
      return inventoryItems;
    }
  }

  var jsonItems;
  List<String> tempHashes = [];

  // Fetch Xur InventoryItemHashes fra Bungie API
  final response = await http.get(
    global.xurURL,
    headers: {"x-api-key": global.bungieAPIKey},
  );

  // Dekoder respons.
  final responseJson = json.decode(response.body);

  print('\nErrorStatus:' + responseJson['ErrorStatus']);

  // Hent itemHasher fra json respons.
  // Hvis det ble mottatt gyldig respons.
  if (responseJson['ErrorStatus'] == "Success" &&
      responseJson['Message'] == "Ok") {
    // Map med inventory items.
    jsonItems =
        responseJson['Response']['sales']['data']['2190858386']['saleItems'];
    // Hvis item er ett exotic item -> itemHash legges til i temp liste.
    jsonItems.forEach((k, v) => tempHashes.add(v['itemHash'].toString()));
  }
  // Hvis naavarende hasher ikke er lik fetchede hasher.
  // Henter data for nye items med hash lik itemHashes fra manifest.
  if (tempHashes.isNotEmpty) {
    if (itemHashes.first != tempHashes.first) {
      itemHashes = tempHashes;
      inventoryItems = [];
      // fetch data for hver itemHash
      for (String itemHash in itemHashes) {
        int intHash = int.parse(itemHash);

        // Hvis item er våpen eller class item
        if (intHash != global.xurItemBlacklist[0] && intHash != global.xurItemBlacklist[1]) {

            print('Fetching data for item with hash hash: ' + itemHash);
            final String url = global.inventoryItemDefinitionURL + itemHash.toString();
            final response = await http.get(
              url,
              headers: {"x-api-key": "0f931b6bb0df4d478305d78ba3332985"},
            );
            final responseJson = json.decode(response.body);
            inventoryItems.add(ExoticItem.fromJson(responseJson['Response']));
          
        }
      }
    }
  }

  _lastFetch = now;
  // Returnerer liste med Item objekter.
  return inventoryItems;
}
