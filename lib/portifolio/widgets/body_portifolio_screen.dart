import 'package:crypto/portifolio/widgets/upper_container_crypto.dart';
import 'package:flutter/material.dart';

import 'listview_crypto.dart';

class BodyPortifolioScreen extends StatelessWidget {
  const BodyPortifolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        UpperContainerCrypto(),
        Divider(thickness: 1, height: 0.5),
        ListViewCryptos(),
      ],
    );
  }
}
