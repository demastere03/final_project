import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

enum Currency { USD, THB, AED, EUR }

enum TimeZone { WIB, WITA, WIT, LondonMusimPanas, LondonMusimDingin }

class MoneyExchanger extends StatefulWidget {
  const MoneyExchanger({Key? key}) : super(key: key);

  @override
  State<MoneyExchanger> createState() => _MoneyExchangerState();
}

class _MoneyExchangerState extends State<MoneyExchanger> {
  Currency selectedCurrency = Currency.USD;
  late Timer timer;
  TimeZone selectedTimeZone = TimeZone.WIB;
  String? formattedTime;

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTimezoneDropdown(),
                _buildFormattedTime(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormattedTime() {
    return Text(
      formattedTime ?? '',
      style: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
    );
  }

  Widget _buildTimezoneDropdown() {
    return DropdownButton<TimeZone>(
      value: selectedTimeZone,
      onChanged: (TimeZone? newValue) {
        setState(() {
          selectedTimeZone = newValue!;
          getTime(); // Update time when timezone changes
        });
      },
      items: TimeZone.values.map((TimeZone timezone) {
        return DropdownMenuItem<TimeZone>(
          value: timezone,
          child: Text("Convert To ${timezone.toString().split('.').last}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        );
      }).toList(),
    );
  }

  Widget buildCurrencyDropdown() {
    return DropdownButton<Currency>(
      value: selectedCurrency,
      onChanged: (Currency? newValue) {
        if (newValue != null) {
          setState(() {
            selectedCurrency = newValue;
          });
        }
      },
      items: Currency.values.map((Currency currency) {
        return DropdownMenuItem<Currency>(
          value: currency,
          child: Text(getCurrencySymbol(currency)),
        );
      }).toList(),
    );
  }

  String formatPrice(double price) {
    switch (selectedCurrency) {
      case Currency.USD:
        return '\$${price.toStringAsFixed(2)}';
      case Currency.THB:
        return '฿${(price * 32).toStringAsFixed(2)}';
      case Currency.AED:
        return 'AED ${(price * 4).toStringAsFixed(0)}';
      case Currency.EUR:
        return '€${(price * 0.85).toStringAsFixed(2)}';
    }
  }

  String getCurrencySymbol(Currency currency) {
    switch (currency) {
      case Currency.USD:
        return '\$';
      case Currency.THB:
        return '฿';
      case Currency.AED:
        return 'AED';
      case Currency.EUR:
        return '€';
    }
  }

  void getTime() async {
    try {
      Response response = await get(
          Uri.parse("https://worldtimeapi.org/api/timezone/Asia/Jakarta"));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      formattedTime = _getFormattedTime(now, selectedTimeZone);
      setState(() {});
    } catch (e) {
      print('Error fetching time: $e');
    }
  }

  String _getFormattedTime(DateTime time, TimeZone timeZone) {
    switch (timeZone) {
      case TimeZone.WIB:
        return '${time.hour}:${time.minute}:${time.second} WIB';
      case TimeZone.WITA:
        return '${time.hour + 1}:${time.minute}:${time.second} WITA';
      case TimeZone.WIT:
        return '${time.hour + 2}:${time.minute}:${time.second} WIT';
      case TimeZone.LondonMusimPanas:
        return '${time.hour + 6}:${time.minute}:${time.second} London (Musim Panas)';
      case TimeZone.LondonMusimDingin:
        return '${time.hour + 7}:${time.minute}:${time.second} London (Musim Dingin)';
      default:
        return '';
    }
  }
}