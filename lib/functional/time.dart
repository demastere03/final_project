import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_akhir/main_page/bottom_bar.dart';

class TimeConvert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Time Converter'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Kembali ke Halaman Utama',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomBar(),
                ),
              );
            },
          ),
        ),
        body: TimeConverter(),
      ),
    );
  }
}

class TimeConverter extends StatefulWidget {
  @override
  _TimeConverterState createState() => _TimeConverterState();
}

class _TimeConverterState extends State<TimeConverter> {
  String _londonTime = '';
  String _tokyoTime = '';
  String _wibTime = '';
  String _witTime = '';
  String _witaTime = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataTable(
              columns: const [
                DataColumn(label: Text('City')),
                DataColumn(label: Text('Time')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('London')),
                  DataCell(Text(_londonTime)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Tokyo')),
                  DataCell(Text(_tokyoTime)),
                ]),
                DataRow(cells: [
                  DataCell(Text('WIB')),
                  DataCell(Text(_wibTime)),
                ]),
                DataRow(cells: [
                  DataCell(Text('WIT')),
                  DataCell(Text(_witTime)),
                ]),
                DataRow(cells: [
                  DataCell(Text('WITA')),
                  DataCell(Text(_witaTime)),
                ]),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _convertTime();
              },
              child: Text('Convert Time'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _convertTime() async {
    final londonTime = DateTime.now().toUtc();
    final tokyoTime = londonTime.add(Duration(hours: 9));
    final wibTime = londonTime.add(Duration(hours: 7));
    final witTime = londonTime.add(Duration(hours: 9));
    final witaTime = londonTime.add(Duration(hours: 8));

    setState(() {
      _londonTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(londonTime);
      _tokyoTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(tokyoTime);
      _wibTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(wibTime);
      _witTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(witTime);
      _witaTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(witaTime);
    });
  }
}
