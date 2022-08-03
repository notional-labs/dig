import 'package:dig_core/src/data/network/env/dig_chain_impl.dart';
import 'package:dig_core/src/domain/env/env.dart';

class DevENV implements ENV {
  @override
  ChainENV get digChain => DigChainTestNet();

  @override
  String get coingeckoBaseUrl => 'https://api.coingecko.com/';
}

class ProdENV implements ENV {
  @override
  ChainENV get digChain => DigChainMainNet();

  @override
  String get coingeckoBaseUrl => 'https://api.coingecko.com/';
}
