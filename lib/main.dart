import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/pages/bottom_navigation.dart';
import 'package:zoho_clone/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: BottomNav(),
    );
  }
}
