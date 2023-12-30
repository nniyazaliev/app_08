import 'package:app_08/domain/coin/models/client_coin_page_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app_08/data/repositories/coin/repositories/coin_repository.dart';

part 'coin_page_provider.g.dart';

// @riverpod
// Future<CoinModel> getCurrencyRate(
//   GetCurrencyRateRef ref,
//   String currency,
// ) async {
//   return await CoinRepository().getCurrencyRate(currency);
// }

@riverpod
class CoinPageNotifier extends _$CoinPageNotifier {
  @override
  Future<ClientCoinPageModel> build(String currency) async {
    final coinModel = await CoinRepository().getCurrencyRate(currency);

    state.value = ClientCoinPageModel(
      coinModel: coinModel,
      currency: currency,
      index: index,
    );
  }
}
