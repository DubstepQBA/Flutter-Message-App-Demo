import 'package:flutter/material.dart';

class EstadoPage extends StatefulWidget {
  const EstadoPage({Key? key}) : super(key: key);

  @override
  State<EstadoPage> createState() => _EstadoPageState();
}

class _EstadoPageState extends State<EstadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add_circle),
      ),
    );
  }
}
