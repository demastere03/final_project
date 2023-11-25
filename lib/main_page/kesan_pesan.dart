import 'package:flutter/material.dart';
import 'package:tugas_akhir/main_page/profile.dart';

class TextFeedbackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kesan dan Pesan Page',
      debugShowCheckedModeBanner: false,
      home: TextFeedbackPage(),
    );
  }
}

class TextFeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Page'),
        centerTitle: true,
        leading:
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Halaman Kesan dan Pesan',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ProfileApp(),
                ),
              );
            },
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kesan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'It is a quite exhausting experience, tapi pada akhirnya tetap bersyukur karena mendapatkan pengetahuan baru mengenai App Mobile itu seperti apa',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pesan:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Tidak ada yang bisa diucapkan selain terima kasih untuk pengetahuan dan kesempatan yang diberikan.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}