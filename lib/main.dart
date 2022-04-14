import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yollors/screens/spalsh.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCo5Z0vW2IFvTr0Yh4eOq2BST8BWlkr_-8",
          appId: "1:257332786374:web:cd3eca230bf9d9ece993c7",
          messagingSenderId: "257332786374",
          projectId:     "yollors-d9004",
));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yollors',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const SplashScreen(),
    );
  }
}
