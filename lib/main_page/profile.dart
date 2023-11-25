import 'package:flutter/material.dart';
import 'package:tugas_akhir/main_page/kesan_pesan.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Halaman Profil',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.textsms_outlined),
            tooltip: 'Halaman Kesan dan Pesan',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => TextFeedbackApp(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('tugas_akhir/assets/DSC01571.JPG'),
            ),
            SizedBox(height: 20),
            Text(
              'Daffa Aditya Pranugraha',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'demastere.03@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              '124210021',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'Passionate in eating and playing racing simulation, shooting games, and mobile idle games',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add log-out functionality here
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}