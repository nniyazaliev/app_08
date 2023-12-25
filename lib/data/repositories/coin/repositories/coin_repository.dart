import 'package:app_08/data/repositories/coin/models/coin_model.dart';
import 'package:app_08/data/services/coin_api_services.dart';

class CoinRepository {
  final CoinAPIServices _coinAPIServices = CoinAPIServices();

  Future<CoinModel> getCurrencyRate(String currency) async {
    return _coinAPIServices.getCurrencyRate(currency);
  }
}
