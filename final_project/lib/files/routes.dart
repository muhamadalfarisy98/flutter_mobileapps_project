import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'HomeScreen.dart';
import 'SplashScreen.dart';
import 'MainMenu.dart';
import 'RegisterScreen.dart';
// import 'Home.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // jika ingin mengirim argument
    // final args = settings.arguments; 
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/mainmenu':
        return MaterialPageRoute(builder: (_) => MainMenu());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
        // return MaterialPageRoute(builder: (_) => AboutPage(args));
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('Error page')),
      );
    });
  }
}