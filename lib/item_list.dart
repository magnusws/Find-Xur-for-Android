import 'package:flutter/material.dart';
import 'models/exotic_item.dart';
import 'models/exotics.dart';
import 'item_detail_view.dart';
import 'animated_list_placeholder.dart';

class ItemList extends StatelessWidget {
  // Item list
  final List<ExoticItem> items;
  final Perks perks;
  final bool isInventoryList;

  // Constructor
  ItemList(this.items, this.perks, this.isInventoryList);

  // Text styles
  final _titleStyle = TextStyle(
      fontSize: 20,
      color: Colors.white,
      letterSpacing: 1,
      fontFamily: 'Product Sans',
      fontWeight: FontWeight.w600);
  final _subtitleStyle = TextStyle(
      fontSize: 14,
      color: Color.fromRGBO(152, 152, 158, 1.0),
      letterSpacing: 1);

  final _priceStyle =
      TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600);

  // returnerer en ListTile (klikkbar)
  Widget _getListItemTile(BuildContext context, int index) {
    // Extracting icon filename from url
    var fileName = items[index].displayProperties.icon;

    final Widget _emptyContainer = Container();

    return Card(
      color: Color.fromRGBO(28, 28, 30, 1.0),
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemDetailView(items[index], perks)),
          );
        },
        child: ListTile(

          // Item icon
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(2.0),
            child: Container(
              width: 56,
              height: 56,
              decoration: new BoxDecoration(
                color: Color.fromRGBO(200, 164, 6, 1.0),
                image: new DecorationImage(
                    image: AssetImage(("assets/images/icons" + fileName)),
                    fit: BoxFit.cover),
                border: new Border.all(color: Colors.white, width: 2.0),
              ),
            ),
          ),

          // Title & subtitle
          title: Text(items[index].displayProperties.name, style: _titleStyle),
          subtitle: Text(items[index].itemTypeAndTierDisplayName,
              style: _subtitleStyle),

          // Currency icon, cost and arrow icon
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  isInventoryList ? Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // Legendary Shard icon
                    child: Image(
                        image: AssetImage("assets/images/materialIcons/ls.png"),
                        width: 26,
                        height: 26),
                  ) : _emptyContainer,

                  isInventoryList ? Container(
                    margin: EdgeInsets.fromLTRB(4, 0, 10, 0),
                    // Item price
                    child: Text(items[index].classType == 3 ? '29 ' : '23 ',
                        style: _priceStyle, textAlign: TextAlign.left),
                  ) : _emptyContainer,

                  // Arrow icon
                  Icon(Icons.arrow_forward, color: Colors.grey[600]),

                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  // INVENTORY LIST
  @override
  Widget build(BuildContext context) {
    // Hvis items => Returnerer List View.
    if (this.items != null) {
      return ListView.builder(
        itemBuilder: _getListItemTile,
        primary: false,
        itemCount: items == null ? 0 : items.length,
      );
    }

    return AnimatedListPLaceholder();

  }
}
