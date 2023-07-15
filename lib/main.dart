import 'package:flutter/material.dart';
import 'package:yooo/views/main.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yooo app.',
      initialRoute: '/',
      routes: {'/': (context) => MainPage()},
    );
  }
}
