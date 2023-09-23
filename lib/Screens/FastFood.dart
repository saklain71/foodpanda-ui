import 'package:flutter/material.dart';

class FastFood extends StatelessWidget {
  const FastFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("No Food Available"),
      ),
    );
  }
}
