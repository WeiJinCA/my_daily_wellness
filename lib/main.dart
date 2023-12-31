import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'home/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import './services/service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Info(),
      child: MaterialApp(
        // title: 'My Daily Wellness',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: _auth.isUserSignedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              bool isUserSignedIn = snapshot.data as bool;
              return isUserSignedIn ? const HomeScreen() : LoginPage();
            }
            return const CircularProgressIndicator();
          },
        ),
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
