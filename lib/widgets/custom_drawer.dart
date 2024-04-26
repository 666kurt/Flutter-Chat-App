import 'package:flutter/material.dart';

import '../service/auth/auth_service.dart';
import '../pages/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void logOut() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // logo
          DrawerHeader(
            child: Icon(
              Icons.message,
              color: Theme.of(context).colorScheme.primary,
              size: 44,
            ),
          ),

          // home link
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("Home".toUpperCase()),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          // setting link
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings".toUpperCase()),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
            ),
          ),

          // logout link
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout".toUpperCase()),
              onTap: logOut,
            ),
          )
        ],
      ),
    );
  }
}
