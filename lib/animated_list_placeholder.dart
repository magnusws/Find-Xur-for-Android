import 'package:flutter/material.dart';

class AnimatedListPLaceholder extends StatefulWidget {
  @override
  _AnimatedListPLaceholder createState() => _AnimatedListPLaceholder();
}

class _AnimatedListPLaceholder extends State<AnimatedListPLaceholder>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _visible = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: 800,)
    )..repeat(reverse: true);

    _visible ? _visible = false : _visible = true;

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller.drive(CurveTween(curve: Curves.easeOut)),

      child: ListView.builder(
        itemBuilder: _getListItemTile,
        primary: false,
        itemCount: 4,
      ),
    );
  }

  Widget _getListItemTile(BuildContext context, int index){
    return Card(
        color: Color.fromRGBO(20, 20, 21, 1.0),
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: ListTile(
          contentPadding: EdgeInsets.all(14),
          leading: Container(
            child: Text(" "),
          ),
        ),
      );
  }
}
