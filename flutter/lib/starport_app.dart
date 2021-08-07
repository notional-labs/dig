import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/pages/routing_page.dart';
import 'package:starport_template/stores/wallets_store.dart';
import 'package:transaction_signing_gateway/gateway/transaction_signing_gateway.dart';

class StarportApp extends StatelessWidget {
  static late TransactionSigningGateway signingGateway;
  static late WalletsStore walletsStore;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starport template',
      theme: CosmosAppTheme.buildAppTheme(),
      home: const RoutingPage(),
    );
  }
}
