import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/app_bar_default.dart';

class BodyConversionScreen extends StatefulHookConsumerWidget {
  const BodyConversionScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<BodyConversionScreen> createState() =>
      _BodyConversionScreenState();
}

class _BodyConversionScreenState extends ConsumerState<BodyConversionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarDefault(title: 'Converter'),
    );
  }
}
