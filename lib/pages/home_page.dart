import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final double days = 30.97;
  final String name = "CAt";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("hello to $days $name  flutter " + name),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
