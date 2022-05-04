import 'dart:math';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Galaxy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GalaxyState();
  }
}

class _GalaxyState extends State<Galaxy> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Bubble> bubbles;
  final int numberOfBubbles = 18;
  final Color color = Colors.blueGrey.withAlpha(20);
  final List<Color> colors = [
    Colors.cyan.withAlpha(20),
    Colors.purple.withAlpha(20),
    Colors.blue.withAlpha(20),
    Colors.pink.withAlpha(20)
  ];
  final double maxBubbleSize = 30.0;

  @override
  void initState() {
    super.initState();

    // Initialize bubbles
    bubbles = List();
    int i = numberOfBubbles;
    while (i > 0) {
      bubbles.add(Bubble(colors[Random().nextInt(4)], maxBubbleSize));
      i--;
    }

    // Init animation controller
    _controller = new AnimationController(
        duration: const Duration(seconds: 1000), vsync: this);
    _controller.addListener(() {
      updateBubblePosition();
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: Stack(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/locationGoneBG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      CustomPaint(
        foregroundPainter:
            BubblePainter(bubbles: bubbles, controller: _controller),
        size: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
      ),
    ])));
  }

  void updateBubblePosition() {
    bubbles.forEach((it) => it.updatePosition());
    setState(() {});
  }
}

class BubblePainter extends CustomPainter {
  List<Bubble> bubbles;
  AnimationController controller;

  BubblePainter({this.bubbles, this.controller});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    bubbles.forEach((it) => it.draw(canvas, canvasSize));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Bubble {
  Color colour;
  double direction;
  double speed;
  double radius;
  double x;
  double y;

  Bubble(Color colour, double maxBubbleSize) {
    this.colour = colour.withOpacity(0.12);
    this.direction = Random().nextDouble() * 360;
    this.speed = 0.1;
    this.radius = Random().nextDouble() * maxBubbleSize;
  }

  draw(Canvas canvas, Size canvasSize) {
    Paint paint = new Paint()
      ..color = colour
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    assignRandomPositionIfUninitialized(canvasSize);

    randomlyChangeDirectionIfEdgeReached(canvasSize);

    canvas.drawCircle(Offset(x, y), radius, paint);
  }

  void assignRandomPositionIfUninitialized(Size canvasSize) {
    if (x == null) {
      this.x = Random().nextDouble() * canvasSize.width;
    }

    if (y == null) {
      this.y = Random().nextDouble() * canvasSize.height;
    }
  }

  updatePosition() {
    var a = 180 - (direction + 90);
    direction > 0 && direction < 180
        ? x += speed * sin(direction) / sin(speed * 2)
        : x -= speed * sin(direction) / sin(speed * 2);
    direction > 90 && direction < 270
        ? y += speed * sin(a) / sin(speed * 2)
        : y -= speed * sin(a) / sin(speed * 2);
  }

  randomlyChangeDirectionIfEdgeReached(Size canvasSize) {
    if (x > canvasSize.width + 150 ||
        x < 0 - 150 ||
        y > canvasSize.height + 150 ||
        y < 0 - 150 ) {
      direction = Random().nextDouble() * 360;
    }
  }
}
