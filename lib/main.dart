import 'package:dars_18/views/screens/contacts_screens.dart';
import 'package:dars_18/views/screens/counter_screen.dart';
import 'package:dars_18/views/screens/todos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todos(),
    );
  }
}