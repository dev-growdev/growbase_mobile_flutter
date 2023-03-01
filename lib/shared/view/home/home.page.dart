import 'package:flutter/material.dart';

import '../../../features/categories/view/categories/categories.page.dart';
import '../../../features/profile/view/profile.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const CategoriesPage(),
        const ProfilePage(),
      ][selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) => setState(() => selectedIndex = index),
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Minha conta',
          ),
        ],
      ),
    );
  }
}
