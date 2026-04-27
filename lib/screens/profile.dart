import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  static const _osuURL =
      'https://go.okstate.edu/go-pokes/images/mobile-images/apple-watch-42-mm/apple-watch-42-9.jpg';

  var editing = true;
  var name = "Reese Roberts";
  var title = "Flutter Developer | CS Student";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                editing = !editing;
              });
            },
            icon: Icon(
              editing ? Icons.save : Icons.edit,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Avitar
            const CircleAvatar(
              radius: 56,
              backgroundImage: NetworkImage(_osuURL),
              backgroundColor: Colors.transparent,
            ),

            // Name and title
            const SizedBox(height: 12),
            
            SizedBox(
              width: 300,
              child: editing ? TextField(
                textAlign: .center,
                controller: TextEditingController(text: name),
                onSubmitted: (newValue) {
                  setState(() {
                    name = newValue;
                  });
                },
              ) : Text(
                name,
                textAlign: .center,
                style: TextStyle(fontSize: 26, fontWeight: .bold),
              )
            ),

            SizedBox(
              width: 300,
              child: editing ? TextField(
                textAlign: .center,
                controller: TextEditingController(text: title),
                onSubmitted: (newValue) {
                  setState(() {
                    title = newValue;
                  });
                },
              ) : Text(
                title,
                textAlign: .center,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
              )
            ),

            
            // Text(
            //   'Flutter Developer | CS Student',
            //   style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            // ),

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
