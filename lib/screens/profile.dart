import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  static const _osuURL =
      'https://go.okstate.edu/go-pokes/images/mobile-images/apple-watch-42-mm/apple-watch-42-9.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Avitar
            const CircleAvatar(
              radius: 56,
              backgroundImage: NetworkImage(_osuURL),
              backgroundColor: Colors.transparent,
            ),

            // Name and title
            const SizedBox(height: 12),
            const Text(
              'Reese Roberts',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              'Flutter Developer | CS Student',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),

            // Return Button
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
