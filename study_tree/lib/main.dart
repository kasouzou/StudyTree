import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:study_tree/Pages/SplashScreenPage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Study Tree App',
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
