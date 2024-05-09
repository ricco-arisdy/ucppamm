import 'package:flutter/material.dart';
import 'package:ucppam/wiget/add_wiget.dart';

class AddTokoScreen extends StatefulWidget {
  const AddTokoScreen({super.key});

  @override
  State<AddTokoScreen> createState() => _AddTokoScreenState();
}

class _AddTokoScreenState extends State<AddTokoScreen> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Toko'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: AddTokoForm(),
      ),
    );
  }
}