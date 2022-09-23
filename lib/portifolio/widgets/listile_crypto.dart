import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import '../../shared/utils/currency_formatter.dart';
import '../controller/visibility_provider.dart';
import 'container_visible.dart';

class ListTitleCrypto extends HookConsumerWidget {
  final CryptoViewData crypto;

  const ListTitleCrypto({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visible = ref.watch(visibilityProvider.state);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: crypto,
        );
      },
      minVerticalPadding: 20,
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(crypto.image),
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
                  '0.5 ${crypto.symbol.toUpperCase()}',
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
