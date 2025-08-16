import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Pages/Login_and_NewUserRegistration_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(StudyTreeApp());
}

class StudyTreeApp extends StatelessWidget {
  const StudyTreeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Study Tree App',
      home: Login_and_NewUserRegistration_page(),
      debugShowCheckedModeBanner: false,
    );
  }
}
