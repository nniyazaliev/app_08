import 'package:app_08/coin_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CoinPage(),
    );
  }
}

/* class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? city;

  void _fun1() {
    log('_fun1');
  }

  Future<void> _fun2() async {
    Future.delayed(Duration(seconds: 5), () {
      log('_fun2');
    });
  }

  void _fun3() {
    log('_fun3');
  }

  void _fun4() {
    log('_fun4');
  }

  @override
  void initState() {
    super.initState();
    //log('initState => city = $city');
  }

  @override
  void didChangeDependencies() async {
    /* _fun1();
    _fun2();
    _fun3();
    _fun4(); */

    await CoinAPIServices().getCurrencyRate();

    //log('didChangeDependencies => city = $city');
    //await _getCity();
    super.didChangeDependencies();
  }

  Future<void> _getCity() async {
    city = await FakeFutureService().getCityFromFuture();
    log('_getCity => city = $city');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: city == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    city!,
                  ),
                ],
              ),
            ),
    );
  }
}
 */