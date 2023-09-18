import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'home/home.dart';
import 'package:provider/provider.dart';
import './services/info_state.dart';

void main() async {
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Info(),
      child: MaterialApp(
        // title: 'My Daily Wellness',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
