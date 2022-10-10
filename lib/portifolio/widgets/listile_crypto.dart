import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';
import '../../shared/utils/currency_formatter.dart';
import '../controller/visibility_provider.dart';
import 'invisible_container.dart';

class ListTitleCrypto extends HookConsumerWidget {
  final CryptoViewData crypto;
  final double cryptoBalance;
  final List<CryptoViewData> list;

  const ListTitleCrypto(
      {Key? key,
      required this.crypto,
      required this.cryptoBalance,
      required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visible = ref.watch(visibilityProvider.state);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: AppArguments(
              crypto: crypto, singleBalance: cryptoBalance, list: list),
        );
      },
      minVerticalPadding: 20,
      leading: Image.network(
        crypto.image,
        scale: 6,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(crypto.symbol.toUpperCase()),
          visible.state
              ? Text(FormatCurrency.format(crypto.currentPrice))
              : const InvisibleContainer(),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            crypto.name,
          ),
          visible.state
              ? Text(
                  '${cryptoBalance.toStringAsFixed(5)} ${crypto.symbol.toUpperCase()}',
                  style: const TextStyle(fontSize: 12),
                )
              : const InvisibleContainer(),
        ],
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
    );
  }
}
