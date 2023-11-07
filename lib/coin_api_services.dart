import 'dart:developer';

import 'package:http/http.dart' as http;

String url = 'https://rest.coinapi.io/v1/exchangerate';
String apiKey = '78B0B838-DDBE-4336-9F17-C6AA6B291BF5';

class CoinAPIServices {
  Future<void> getCurrencyRate() async {
    var uri = Uri.parse('$url/BTC/USD?apiKey=$apiKey');

    // Await the http get response, then decode the json-formatted response.

    /* http.head(uri, headers: {
      "X-CoinAPI-Key": apiKey // Replace ypur API key
    }); */
    var response = await http.get(
      uri,
      /* headers: {
        "X-CoinAPI-Key": apiKey // Replace ypur API key
      }, */
    );

    // await http.post(uri);
    // await http.put(uri);
    // await http.delete(uri);

    if (response.statusCode == 200) {
      String responceBode = response.body;

      log('responceBode = $responceBode');

      /* var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.'); */
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}


// HTTP request
// CRUD 
// C - Create
// R - Read
// U - Update
// D - Delete