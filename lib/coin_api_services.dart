import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

String url = 'https://rest.coinapi.io/v1/exchangerate';
String apiKey = '78B0B838-DDBE-4336-9F17-C6AA6B291BF5';

class CoinAPIServices {
  Future<Map<String, dynamic>> getCurrencyRate(String currency) async {
    // var uri = Uri.parse('$url/BTC/USD?apiKey=$apiKey');
    var uri = Uri.parse('$url/BTC/$currency');

    http.Response response = await http.get(
      uri,
      headers: {
        "X-CoinAPI-Key": apiKey // Replace ypur API key
      },
    );

    // await http.post(uri);
    // await http.put(uri);
    // await http.delete(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
          jsonDecode(response.body) as Map<String, dynamic>;

      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');

      return {};
    }
  }
}


// HTTP request
// CRUD 
// C - Create
// R - Read
// U - Update
// D - Delete