// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:price_alert/controllers/mainscreen_provider.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'market_screen.dart';
import 'set_alerts_screen.dart';
import 'package:price_alert/shared/bottom_nav.dart';

import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = const [
    MarketScreen(),
    DashBoard(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, notifier, child) {
        return Scaffold(
          bottomNavigationBar: const BottomNav(),
          body: pageList[notifier.pageIndex],
        );
      },
    );
  }
}
