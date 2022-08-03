import 'package:alan/wallet/network_info.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:grpc/grpc.dart';

class DigChainTestNet implements ChainENV {
  @override
  String get lcdUrl => 'https://api-1-dig.notional.ventures';

  @override
  int get lcdPort => 443;

  @override
  String get grpcUrl => 'https://grpc-dig.notional.ventures';

  @override
  int get grpcPort => 443;

  @override
  String get baseApiUrl => '$lcdUrl:$lcdPort/';

  @override
  String get bech32Hrp => 'dig';

  @override
  String get chainId => 'dig-1';

  @override
  NetworkInfo get networkInfo => NetworkInfo(
        bech32Hrp: bech32Hrp,
        lcdInfo: LCDInfo(
          host: lcdUrl,
          port: lcdPort,
        ),
        grpcInfo: GRPCInfo(
          host: grpcUrl,
          port: grpcPort,
          credentials: grpcPort == 443
              ? const ChannelCredentials.secure()
              : const ChannelCredentials.insecure(),
        ),
      );
}

class DigChainMainNet implements ChainENV {
  @override
  String get lcdUrl => 'https://api-1-dig.notional.ventures';

  @override
  int get lcdPort => 443;

  @override
  String get grpcUrl => 'https://grpc-dig.notional.ventures';

  @override
  int get grpcPort => 443;

  @override
  String get baseApiUrl => '$lcdUrl:$lcdPort/';

  @override
  String get bech32Hrp => 'dig';

  @override
  String get chainId => 'dig-1';

  @override
  NetworkInfo get networkInfo => NetworkInfo(
        bech32Hrp: bech32Hrp,
        lcdInfo: LCDInfo(
          host: lcdUrl,
          port: lcdPort,
        ),
        grpcInfo: GRPCInfo(
          host: grpcUrl,
          port: grpcPort,
          credentials: grpcPort == 443
              ? const ChannelCredentials.secure()
              : const ChannelCredentials.insecure(),
        ),
      );
}
