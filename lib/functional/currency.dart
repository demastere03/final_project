import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_akhir/main_page/bottom_bar.dart';

class MoneyConvert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Currency Converter'),
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
        body: CurrencyConverter(),
      ),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _amountController = TextEditingController();
  String _fromCurrency = 'IDR';
  String _toCurrency = 'IDR';
  double _convertedAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Amount'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCurrencyDropdown('From', _fromCurrency),
              _buildCurrencyDropdown('To', _toCurrency),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _convertCurrency();
            },
            child: Text('Convert'),
          ),
          SizedBox(height: 20),
          Text('Converted Amount: $_convertedAmount $_toCurrency'),
        ],
      ),
    );
  }

  Widget _buildCurrencyDropdown(String label, String selectedCurrency) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButton<String>(
          value: selectedCurrency,
          onChanged: (String? newValue) {
            setState(() {
              if (label == 'From') {
                _fromCurrency = newValue!;
              } else {
                _toCurrency = newValue!;
              }
            });
          },
          items: ['USD', 'GBP', 'JPY', 'IDR']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Future<void> _convertCurrency() async {
    final String apiUrl =
        'https://api.exchangerate-api.com/v4/latest/$_fromCurrency';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final double exchangeRate = data['rates'][_toCurrency];
        final double amount = double.parse(_amountController.text);
        final double result = amount * exchangeRate;

        setState(() {
          _convertedAmount = result;
        });
      } else {
        throw Exception('Failed to load exchange rates');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
