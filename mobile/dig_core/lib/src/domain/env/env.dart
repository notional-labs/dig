import 'package:alan/wallet/network_info.dart';

abstract class ENV {
  ChainENV get digChain;
  String get coingeckoBaseUrl;

  /// TODO: Define other chain here
  /// Example:
  ///    ChainENV get cosmosChain;
}

abstract class ChainENV {
  String get lcdUrl;
  int get lcdPort;
  String get grpcUrl;
  int get grpcPort;
  String get baseApiUrl;
  String get bech32Hrp;
  String get chainId;
  NetworkInfo get networkInfo;
}
