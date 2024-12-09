import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project3/screen/home_screen.dart';
import 'package:project3/screen/welcome_screen.dart';
import 'package:project3/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CarentalApp());
}

class CarentalApp extends StatelessWidget {
  const CarentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarRentalApp',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: HomeScreen(),
    );
  }
}
