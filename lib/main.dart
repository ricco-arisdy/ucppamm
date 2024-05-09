import 'package:flutter/material.dart';
import 'package:ucppam/wiget/add_wiget.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aplikasi Wisata Kuliner',
      home: AddTokoForm(),
    );
  }
}
