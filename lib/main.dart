import 'package:flutter/material.dart';
import 'screens/auth/auth.dart'; // ✅ import your Auth screen
// import 'screens/home/home.dart'; // optional

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Auth(),
    );
  }
}
