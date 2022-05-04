import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:find_xur/root_widget.dart';
import 'package:find_xur/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'findXur',
    options: const FirebaseOptions(
      googleAppID: APP_ID,
      apiKey: API_KEY,
      projectID: 'find-xur',
    ),
  );

  
  final Firestore firestore = Firestore(app: app);

  runApp(MyApp(firestore: firestore));
}

class MyApp extends StatelessWidget {
  MyApp({this.firestore});

  final Firestore firestore;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      return MaterialApp(
      theme: kXurTheme,
      title: 'Find Xur',
      debugShowCheckedModeBanner: false,
      home: RootWidget(firestore: firestore),
    );
  }
}

