import 'package:bmi_tracker_mb_advisor/screens/blog/blog_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/member/member_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/profile/profile_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/workspace/workspace_screen.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_health_menu/screens/screens.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = [
    WorkspaceScreen(),
    // // WeeklyMenuScreen(),
    MemberScreen(),
    BlogScreen(),
    ProfileScreen(),
    // AdvisorScreen(),
    // ProfileScreen(),
    // UpdateProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline_rounded),
            label: 'Workspace',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.menu_book),
          //   label: 'Weekly Menu',
          // ),
          BottomNavigationBarItem(
            // icon: Icon(Icons.newspaper_rounded),
            icon: Icon(Icons.person),
            label: 'Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded),
            label: 'Exercise',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
