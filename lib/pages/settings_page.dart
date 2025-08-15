import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  final String title = "settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Settings Page"),
        //actions: [IconButton(onPressed: logOut, icon: Icon(Icons.logout))],
      ),
    );
  }
}