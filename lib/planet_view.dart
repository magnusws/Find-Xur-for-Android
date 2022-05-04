import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Planet extends StatelessWidget {
  final DocumentSnapshot document;
  Planet(this.document);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            child: IgnorePointer(
      child: PlanetView(doc: document),
    )));
  }
}

class PlanetView extends StatefulWidget {
  PlanetView({Key key, this.doc}) : super(key: key);
  final DocumentSnapshot doc;

  @override
  _PlanetViewState createState() => _PlanetViewState(doc: this.doc);
}

class _PlanetViewState extends State<PlanetView>
    with SingleTickerProviderStateMixin {
  _PlanetViewState({this.doc});

  DocumentSnapshot doc;
  Scene _scene;
  Object _planet;
  AnimationController _controller;

  final Map locations = {
    0: 'assets/planets/4000_earth.jpg',
    1: 'assets/planets/4000_earth.jpg',
    2: 'assets/planets/4000_earth.jpg',
    3: 'assets/planets/4000_io_2.jpg',
    4: 'assets/planets/4000_titan.jpg',
    5: 'assets/planets/4000_nessus.jpg',
    10: 'assets/planets/4000_earth.jpg',
  };

  void generateSphereObject(Object parent, String name, double radius,
      bool backfaceCulling, String texturePath) async {
    final Mesh mesh =
        await generateSphereMesh(radius: radius, texturePath: texturePath);
    parent
        .add(Object(name: name, mesh: mesh, backfaceCulling: backfaceCulling));
      _scene.updateTexture();
  }

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: 200000), vsync: this)
      ..addListener(() {
        if (_planet != null) {
          _planet.rotation.y = _controller.value * 360;
          _planet.updateTransform();
          _scene.update();
        }
      })
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (this.doc['locationId'] != null) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.0),
        body: Container(
          child: Cube(onSceneCreated: (Scene scene) {
            _scene = scene;

            // Set camera position
            _scene.camera.position.z = 16;

            // Create planet by code
            _planet =
                Object(name: 'destinyPlanet', scale: Vector3(13.4, 13.4, 13.4));

            generateSphereObject(_planet, 'currentPlanet', 0.494, true,
                locations[this.doc['locationId']]);

            // Set planet position & add to scene
            _planet.position.x = 4;
            _planet.position.y = 0.1;
            _scene.world.add(_planet);
          }),
        ),
      );
    }

    return Center(
      child: Text("..."),
    );
    
  }

Future<Mesh> generateSphereMesh(
    {num radius = 0.5,
    int latSegments = 32,
    int lonSegments = 64,
    String texturePath}) async {
  int count = (latSegments + 1) * (lonSegments + 1);
  List<Vector3> vertices = List<Vector3>(count);
  List<Offset> texcoords = List<Offset>(count);
  List<Polygon> indices = List<Polygon>(latSegments * lonSegments * 2);

  int i = 0;
  for (int y = 0; y <= latSegments; ++y) {
    final double v = y / latSegments;
    final double sv = math.sin(v * math.pi);
    final double cv = math.cos(v * math.pi);
    for (int x = 0; x <= lonSegments; ++x) {
      final double u = x / lonSegments;
      vertices[i] = Vector3(radius * math.cos(u * math.pi * 2.0) * sv,
          radius * cv, radius * math.sin(u * math.pi * 2.0) * sv);
      texcoords[i] = Offset(1.0 - u, 1.0 - v);
      i++;
    }
  }

  i = 0;
  for (int y = 0; y < latSegments; ++y) {
    final int base1 = (lonSegments + 1) * y;
    final int base2 = (lonSegments + 1) * (y + 1);
    for (int x = 0; x < lonSegments; ++x) {
      indices[i++] = Polygon(base1 + x, base1 + x + 1, base2 + x);
      indices[i++] = Polygon(base1 + x + 1, base2 + x + 1, base2 + x);
    }
  }

  ui.Image texture = await loadImageFromAsset(texturePath);
  final Mesh mesh = Mesh(
      vertices: vertices,
      texcoords: texcoords,
      indices: indices,
      texture: texture,
      texturePath: texturePath);

  return mesh;
}

}

