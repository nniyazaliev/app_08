import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app_08/data/repositories/coin/models/coin_model.dart';
import 'package:app_08/data/repositories/coin/repositories/coin_repository.dart';

part 'coin_page_provider.g.dart';

@riverpod
Future<CoinModel> getCurrencyRate<String>(GetCurrencyRateRef ref, arg) async {
  return await CoinRepository().getCurrencyRate(arg);
}
