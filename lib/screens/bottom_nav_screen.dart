import 'package:flutter/material.dart';
import 'package:zero_balance/screens/payment_screen.dart';
import 'package:zero_balance/screens/planning_screen.dart';
import 'package:zero_balance/screens/reward_screen.dart';

import 'home_screen.dart';


class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    const PaymentScreen(),
    const PlanningScreen(),
    const RewardScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                title: Text("Home"),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.credit_card,
                ),
                title: Text("Payments"),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bar_chart,
                ),
                title: Text("Stats"),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.workspaces_rounded,
                ),
                title: Text("Rewards"),
                backgroundColor: Colors.white),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
