import 'package:flutter/material.dart';
import 'dart:developer';
// import 'package:intl/intl.dart';
import 'files/routes.dart';
// import 'files/LoginScreen.dart';
// import 'files/HomeScreen.dart';
// import 'files/StartingScreen.dart';
// import 'files/AboutMe.dart';

// Auth
import 'package:firebase_core/firebase_core.dart';

// Bloc provider
// import 'bloc_provider/mainScreen.dart';
// import 'bloc_provider/counter.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc Cubit
// import 'bloc_cubit/counter.dart';
// import 'bloc_cubit/mainScreen2.dart';

// Splash Screen
// import 'files/SplashScreen.dart';
// import 'files/LoginScreen.dart';

// dio
import 'package:dio/dio.dart';

import 'models/list_batik.dart';
import 'files/GetDataBatik.dart';
import 'files/GetDataNews.dart';
// import 'files/RegisterScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: GetDataNews(),
    );
  }
}