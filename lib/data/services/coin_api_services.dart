import 'package:app_08/data/repositories/coin/models/coin_model.dart';
import 'package:app_08/data/services/network_services.dart';
import 'package:app_08/utils/constant_datas.dart';

class CoinAPIServices {
  Future<CoinModel> getCurrencyRate(String currency) async {
    final uri = Uri.parse('${ApiKeys.url}/BTC/$currency');

    final data = await NetworkServices.get(uri);

    final CoinModel coinModel = CoinModel.fromJson(data);

    return coinModel;
  }

  // Future getPeriods() async {
  //   /// history/periods
  //   final uri = Uri.parse('${ApiKeys.url}/history/periods');
  //   final data = await NetworkServices().get(uri);
  // }
}
