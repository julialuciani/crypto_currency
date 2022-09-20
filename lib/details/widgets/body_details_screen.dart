import 'package:flutter/material.dart';
import 'package:crypto/details/widgets/change_days_button.dart';
import 'package:crypto/details/widgets/column_infos.dart';
import 'package:crypto/details/widgets/upper_column_crypto.dart';
import '../../shared/templates/button_default_app.dart';
import 'chart_details_screen.dart';

class BodyDetailsScreen extends StatelessWidget {
  const BodyDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          UpperColumnCrypto(),
          ChartDetailsScreen(),
          ChangeDaysButtons(),
          ColumnInfos(),
          SizedBox(height: 5),
          ButtonDetailsScreen(),
        ],
      ),
    );
  }
}
