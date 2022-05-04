import "dart:ui" as ui;
import 'package:flutter/material.dart';

class CountdownView extends StatefulWidget {
  CountdownView({Key key, this.duration}) : super(key: key);
  final Duration duration;

  @override
  _CountdownViewState createState() => _CountdownViewState(duration: duration);
}

class _CountdownViewState extends State<CountdownView>
    with TickerProviderStateMixin {
  AnimationController _controller;

  // Background color
  final bgColor = Color.fromRGBO(14, 14, 16, 0.6);

  // TextStyle for time dividers
  final _dividerStyle = TextStyle(
      fontSize: 44,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontFamily: 'Roboto');

  _CountdownViewState({Duration duration}) {
    if (!duration.isNegative) {
      this._controller = AnimationController(
          duration: duration, reverseDuration: duration, vsync: this);
    } else {
      this._controller = AnimationController(
          duration: Duration(milliseconds: 0), reverseDuration: Duration(milliseconds: 0), vsync: this);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.reverse(
      from: _controller.value == 0.0 ? 1.0 : _controller.value,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Center(
          child: ClipRRect(
            // <-- clips to the [Container] below
            borderRadius: BorderRadius.circular(28.0),
            // Filter: blurs the Container below
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              // Root Container
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.92,
                height: 172.0,
                color: bgColor,
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Center(
                          child: Text(
                            _controller.isAnimating ? "XÛR WILL ARRIVE IN" : "VERIFYING LOCATION",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        AnimatedBuilder(
                            animation: _controller,
                            builder: (BuildContext context, Widget child) {
                              return timeView;
                            }),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container get timeView {
    Duration timeLeft = _controller.duration * _controller.value;
    String days = '${(timeLeft.inDays).toString().padLeft(2, '0')}';
    String hours = '${(timeLeft.inHours % 24).toString().padLeft(2, '0')}';
    String minutes = '${(timeLeft.inMinutes % 60).toString().padLeft(2, '0')}';
    String seconds = '${(timeLeft.inSeconds % 60).toString().padLeft(2, '0')}';

    // hvis det er telt ned til 0:
    if (days == '00' && hours == '00' && minutes == '00' && seconds == '00') {
      // returnerer loading indicator
      return Container(
        margin: EdgeInsets.all(14),
        width:200,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );

      // Hvis det er tid igjen til han ankommer, teller ned til oppdagering:
    } else {
      return Container(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Center(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(days, style: Theme.of(context).textTheme.headline3),
                  Text("DAYS", style: Theme.of(context).textTheme.caption),
                ],
              ),
              Text(":", style: _dividerStyle),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(hours, style: Theme.of(context).textTheme.headline3),
                  Text("HOURS", style: Theme.of(context).textTheme.caption),
                ],
              ),
              Text(":", style: _dividerStyle),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(minutes, style: Theme.of(context).textTheme.headline3),
                  Text("MINUTES", style: Theme.of(context).textTheme.caption),
                ],
              ),
              Text(":", style: _dividerStyle),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(seconds, style: Theme.of(context).textTheme.headline3),
                  Text("SECONDS", style: Theme.of(context).textTheme.caption),
                ],
              ),
            ],
          )));
    }
  }
}
