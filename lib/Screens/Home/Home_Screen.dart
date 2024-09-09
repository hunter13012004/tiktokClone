import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:tiktok_clone/Screens/Add_vid/Add_video_Screen.dart';
import 'package:tiktok_clone/Screens/Home/Home_Page.dart';
import 'package:tiktok_clone/Screens/Search/Search_Screen.dart';
import 'package:tiktok_clone/Screens/inbox/Inbox_Screen.dart';
import 'package:tiktok_clone/Screens/me/Accounts_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: HomePage(),
            item: ItemConfig(
                icon: Icon(Icons.home),
                title: 'Home',
                activeForegroundColor: Colors.white,
                inactiveBackgroundColor: Colors.black),
          ),
          PersistentTabConfig(
            screen: SearchScreen(),
            item: ItemConfig(
              icon: Icon(Icons.search),
              title: 'Search',
              activeColorSecondary: Colors.white,
              activeForegroundColor: Colors.white,
            ),
          ),
          PersistentTabConfig(
            screen: AddVideoScreen(),
            item: ItemConfig(
                icon: Icon(Icons.add), activeForegroundColor: Colors.white),
          ),
          PersistentTabConfig(
            screen: InboxScreen(),
            item: ItemConfig(
                icon: Icon(Icons.message_outlined),
                title: 'Inbox',
                activeForegroundColor: Colors.white),
          ),
          PersistentTabConfig(
            screen: AccountsScreen(),
            item: ItemConfig(
                icon: Icon(Icons.person),
                title: 'Me',
                activeForegroundColor: Colors.white),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style14BottomNavBar(
              navBarConfig: navBarConfig,
              navBarDecoration: NavBarDecoration(
                color: Colors.black,
              ),
            ));
  }
}
