import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';

class MnemonicOnboardingPage extends StatefulWidget {
  const MnemonicOnboardingPage({Key? key}) : super(key: key);

  @override
  _MnemonicOnboardingPageState createState() => _MnemonicOnboardingPageState();
}

class _MnemonicOnboardingPageState extends State<MnemonicOnboardingPage> {
  String mnemonic = "";

  List<String> get mnemonicWords => mnemonic.trim().split(' ');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CosmosAppBar(
        title: "Wallet Creation",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: CosmosAppTheme.spacingM),
          child: ContentStateSwitcher(
            isEmpty: mnemonic.isEmpty,
            emptyChild: Center(
              child: CosmosElevatedButton(
                onTap: _generateMnemonicClicked,
                text: "Create new Wallet",
              ),
            ),
            contentChild: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CosmosMnemonicWordsGrid(mnemonicWords: mnemonicWords),
                  const SizedBox(height: CosmosAppTheme.spacingM),
                  const Text(
                    'Follow best practices for security. Be sure to write your mnemonic pass phrase in a safe place. '
                    'This phrase is the only way to recover your account if you forget your password. '
                    'Without your password or recovery passphrase, account recovery is not possible. '
                    'Even Emeris cannot help you.',
                    textAlign: TextAlign.center,
                  ),
                  CosmosElevatedButton(
                    onTap: _proceedClicked,
                    text: "Proceed",
                    suffixIcon: const Icon(Icons.arrow_forward),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _generateMnemonicClicked() => setState(() => mnemonic = generateMnemonic());

  void _proceedClicked() => notImplemented(context);
}
