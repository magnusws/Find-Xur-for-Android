import 'package:flutter/material.dart';

class MapView extends StatefulWidget {
  MapView({Key key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
      elevation: 10.0,
        context: context,
        builder: (ctx) {
          return Container(
            height: 800,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/mapEDZ.jpg"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
          side: BorderSide(color: Colors.grey[900]),
        ),
        onPressed:() =>  displayBottomSheet(context),
        child: const Text('     SHOW MAP     ', style: TextStyle(fontSize: 16, letterSpacing: 3)),
        color: Color.fromRGBO( 28, 28, 30, 1.0),
        padding: EdgeInsets.all(18),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width > 400 ? 16 : 10),
    );
  }
}