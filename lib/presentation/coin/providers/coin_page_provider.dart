import 'package:app_08/data/repositories/coin/models/coin_model.dart';

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
  Future<CoinModel> build(String currency) async {
    return await CoinRepository().getCurrencyRate(currency);
  }
}
