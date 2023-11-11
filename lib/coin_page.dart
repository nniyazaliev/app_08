import 'dart:developer';

import 'package:app_08/constant_datas.dart';
import 'package:flutter/material.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  _CoinPageState createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  double _btcValue = 0;
  double _fiatMoneyValue = 0;
  String _fiatMoneyName = 'USD';

  String dropdownValue = currencyList.first;

  /* void fillItems() {
    for (var currency in currencyList) {
      final dropdownMenuItem = DropdownMenuItem<String>(
        value: currency,
        child: Text(currency),
      );

      log('dropdownMenuItem = ${dropdownMenuItem.value}');

      items.add(dropdownMenuItem);
    }

    log('items = $items');
  } */

  void _tizmeniAilanypOzgort() {
    currencyList.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildDropDown() {
    List<DropdownMenuItem<String>> items = [];

    for (var currency in currencyList) {
      items.add(
        DropdownMenuItem<String>(
          value: currency,
          child: Text(
            currency,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      );
    }

    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String? value) {
        setState(() {
          log('onChanged value = $value');
          dropdownValue = value!;
        });
      },
      items: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          '🤑 Coin Ticker',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 10,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                  ),
                  child: Text(
                    '$_btcValue BTC = $_fiatMoneyValue $_fiatMoneyName'
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            height: 200,
            width: double.infinity,
            child: Center(
              child: _buildDropDown(),
            ),
          )
        ],
      ),
    );
  }
}
