import 'package:flutter/material.dart';

import '../../portifolio/model/crypto_view_data.dart';
import '../../portifolio/widgets/listview_crypto.dart';

Future<dynamic> ModalBottomSheetCryptos(
    BuildContext context, List<CryptoViewData> data) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    context: context,
    builder: (context) {
      return SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 3,
              width: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 15),
                  child: Text(
                    'Escolha uma moeda para converter',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1),
            const ListViewCryptos(),
          ],
        ),
      );
    },
  );
}
