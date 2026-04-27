import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'profile.dart';

import 'dart:io' show Platform;

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key, required this.toggleTheme});

  final VoidCallback toggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        //light/dark mode toggle
        actions: [
          IconButton(
            onPressed: () {
              toggleTheme();
            },
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Welcome to my Profile App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate to the profile page
                Route route = Platform.isIOS
                    ? CupertinoPageRoute(builder: (_) => const ProfilePage())
                    : MaterialPageRoute(builder: (_) => const ProfilePage());
                Navigator.push(context, route);
              },
              child: const Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
