import 'package:flutter/material.dart';
class LlamadaPage extends StatefulWidget {
  const LlamadaPage({Key? key}) : super(key: key);

  @override
  State<LlamadaPage> createState() => _LlamadaPage();
}

class _LlamadaPage extends State<LlamadaPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.call),
      ),
    );
  }
}