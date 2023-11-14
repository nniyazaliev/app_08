import 'dart:developer';

import 'dart:io' show Platform;

import 'package:app_08/coin_api_services.dart';
import 'package:app_08/constant_datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  _CoinPageState createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  int _btcValue = 1;
  double _fiatMoneyValue = 0;

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

  int _selectedItemIndex = (currencyList.length / 2).round();

  @override
  void didChangeDependencies() async {
    //log('didChangeDependencies => city = $city');
    //await _getCity();
    await getCurrencyRate(currencyList[_selectedItemIndex]);

    super.didChangeDependencies();
  }

  Future<void> getCurrencyRate(String currency) async {
    final response = await CoinAPIServices().getCurrencyRate(
      currency,
    );

    log('Response.rate = $response');

    _fiatMoneyValue = (response['rate'] as double).roundToDouble();
    log('_fiatMoneyValue = $_fiatMoneyValue');

    setState(() {});
  }

  Widget buildItemsForiOS() {
    return CupertinoPicker(
      magnification: 1.22,
      squeeze: 1.2,
      useMagnifier: true,
      itemExtent: 30,
      // This sets the initial item.
      scrollController: FixedExtentScrollController(
        initialItem: _selectedItemIndex,
      ),
      // This is called when selected item is changed.
      onSelectedItemChanged: (int selectedItem) async {
        await getCurrencyRate(currencyList[selectedItem]);
        setState(() {
          _selectedItemIndex = selectedItem;
        });
      },
      children: currencyList
          .map<Widget>((currency) => Center(
                child: Text(
                  currency,
                ),
              ))
          .toList(),

      /* List<Widget>.generate(currencyList.length, (int index) {
        return Center(
          child: Text(
            currencyList[index],
          ),
        );
      }), */
    );
  }

  Widget buildItemsForAndroid() {
    //1-chi zholu
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
    //1-chi choldun aiagy

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
          dropdownValue = value!;
        });
      },
      items: items,
    );
  }

  //2-chi zholu
  List<DropdownMenuItem<String>> _tizmeniAilanypOzgort() {
    return currencyList.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: const TextStyle(color: Colors.black),
        ),
      );
    }).toList();
  }

  String getSelectCurrency() {
    if (Platform.isAndroid) {
      return currencyList[_selectedItemIndex];
    } else {
      return dropdownValue;
    }
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
                    '$_btcValue BTC = $_fiatMoneyValue ${getSelectCurrency()}'
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
              child:
                  Platform.isIOS ? buildItemsForAndroid() : buildItemsForiOS(),
            ),
          )
        ],
      ),
    );
  }
}
