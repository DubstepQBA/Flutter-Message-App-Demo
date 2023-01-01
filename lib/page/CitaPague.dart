import 'package:flutter/material.dart';
class CitaPage extends StatefulWidget {
  const CitaPage({Key? key}) : super(key: key);

  @override
  State<CitaPage> createState() => _CitaPageState();
}

class _CitaPageState extends State<CitaPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.heart_broken_sharp),
      ),
    );
  }
}
