import 'dart:io' show Platform;

import 'package:app_08/data/repositories/coin/models/coin_model.dart';

import 'package:app_08/presentation/coin/providers/coin_page_provider.dart';

import 'package:app_08/utils/constant_datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  _CoinPageState createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  final int _btcValue = 1;

  String dropdownValue = currencyList.first;

  int _selectedItemIndex = (currencyList.length / 2).round();

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
        body: Consumer(
          builder: (context, ref, child) {
            final currencyProvider = ref.watch(
              CoinPageNotifierProvider(currencyList[_selectedItemIndex]),
            );

            return switch (currencyProvider) {
              AsyncError(:final error) => Center(child: Text('Error: $error')),
              AsyncData(value: final coinModel) => Column(
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
                            child: _buildText(coinModel),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      height: 200,
                      width: double.infinity,
                      child: Center(
                        child: Platform.isIOS
                            ? buildItemsForAndroid()
                            : buildItemsForiOS(ref),
                      ),
                    )
                  ],
                ),
              _ => const Center(
                  child: CircularProgressIndicator(),
                ),
            };
          },
        ));
  }

  Widget buildItemsForiOS(WidgetRef ref) {
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
      onSelectedItemChanged: (int selectedItem) {
        // ref.read(getCurrencyRateProvider);

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
    );
  }

  Widget buildItemsForAndroid() {
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
          dropdownValue = value!;
        });
      },
      items: items,
    );
  }

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

  Widget _buildText(CoinModel coinModel) {
    return Text(
      '$_btcValue BTC = ${coinModel.rate.toStringAsFixed(2)} ${getSelectCurrency()}'
          .toUpperCase(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
