import 'package:flutter/material.dart';

import 'package:crypto/details/widgets/change_days_button.dart';
import 'package:crypto/details/widgets/chart_details_screen.dart';
import 'package:crypto/details/widgets/column_infos.dart';
import 'package:crypto/details/widgets/upper_column_crypto.dart';
import 'package:crypto/shared/models/crypto_model.dart';

import '../../conversion/view/conversion_page.dart';
import '../../shared/templates/button_default_app.dart';

class BodyDetailsScreen extends StatelessWidget {
  const BodyDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          UpperColumnCrypto(),
          ChartDetailsScreen(),
          ChangeDaysButtons(),
          ColumnInfos(),
          ButtonDefaultApp(
            action: ConversionPage(),
          ),
        ],
      ),
    );
  }
}
