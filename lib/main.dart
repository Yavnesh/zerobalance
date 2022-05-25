import 'package:flutter/material.dart';
import 'package:zero_balance/screens/bottom_nav_screen.dart';

void main() {
  runApp(const ZeroBalance());
}

class ZeroBalance extends StatelessWidget {
  const ZeroBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero Balance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const BottomNavScreen(),
    );
  }
}