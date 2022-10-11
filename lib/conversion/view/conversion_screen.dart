import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/portfolio/controller/crypto_individual_balance_notifier.dart';

import '../../l10n/core_strings.dart';
import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/style/colors.dart';
import '../../shared/templates/app_bar_default.dart';
import '../controller/cryptos_provider.dart';
import '../methods/conversion_methods.dart';
import '../widgets/button_change_coin.dart';
import '../widgets/interactive_text.dart';
import '../widgets/total_container.dart';
import '../widgets/total_in_real.dart';
import '../widgets/upper_container_conversion.dart';

class ConversionScreen extends StatefulHookConsumerWidget {
  static const route = '/conversion';
  CryptoViewData crypto;
  final double singleBalance;
  final List<CryptoViewData> list;

  ConversionScreen({
    super.key,
    required this.crypto,
    required this.singleBalance,
    required this.list,
  });

  @override
  ConsumerState<ConversionScreen> createState() => _ConversionState();
}

class _ConversionState extends ConsumerState<ConversionScreen> {
  TextEditingController valueController = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool validate = false;

  @override
  void initState() {
    super.initState();
    valueController.addListener(getLastestValue);
    Future.delayed(Duration.zero, () {
      ref.read(rightCryptoProvider.state).state = widget.crypto;
      ref.read(leftCryptoProvider.state).state = widget.crypto;
    });
  }

  String getLastestValue() {
    String value = valueController.text;

    return value;
  }

  @override
  Widget build(BuildContext context) {
    var cryptoRight = ref.watch(rightCryptoProvider.state).state;
    var cryptoLeft = ref.watch(leftCryptoProvider.state).state;
    var cryptoBalanceList = ref.read(singleBalanceProvider);
    var cryptoSingleBalance = cryptoBalanceList.elementAt(
      widget.list.indexWhere((element) => element.id == cryptoLeft.id),
    );

    return Form(
      key: _key,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarDefault(title: CoreString.of(context)!.convert),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpperAvailableBalanceContainer(
                crypto: cryptoLeft,
                singleBalance: cryptoSingleBalance,
              ),
              const InteractiveText(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonChangeCoin(
                    crypto: cryptoLeft,
                    data: widget.list,
                    id: '1',
                  ),
                  IconButton(
                    icon: const Icon(Icons.compare_arrows, color: magenta),
                    onPressed: () {
                      CryptoViewData temp = cryptoLeft;
                      setState(() {
                        ref.read(leftCryptoProvider.state).state = cryptoRight;
                        ref.read(rightCryptoProvider.state).state = temp;
                      });
                    },
                  ),
                  ButtonChangeCoin(
                    crypto: cryptoRight,
                    data: widget.list,
                    id: '2',
                  ),
                ],
              ),
              TextFormField(
                showCursor: false,
                controller: valueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: magenta,
                      width: 3,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: magenta, width: 3)),
                  hintText: '${cryptoLeft.symbol.toUpperCase()} 0.00',
                  hintStyle: TextStyle(
                    fontSize: 30,
                    color: Colors.grey.shade500,
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,6}')),
                ],
                onChanged: (value) {
                  if (_key.currentState!.validate()) validate = true;
                  setState(() {
                    ConversionMethods.formatLatestValue(
                        ConversionMethods.convertLatestValue(
                            valueController.text, cryptoLeft));
                    ConversionMethods.getTotal(
                        cryptoRight,
                        ConversionMethods.convertLatestValue(
                            valueController.text, cryptoLeft));
                  });
                },
                validator: (value) {
                  if (value == '' || value == null) {
                    return CoreString.of(context)!.writeS;
                  } else if (!ConversionMethods.isCorrect(value) ||
                      value.startsWith('.')) {
                    return CoreString.of(context)!.theValue;
                  } else if (double.parse(ConversionMethods.formattingValue(
                          value.toString())) ==
                      0) {
                    validate = false;
                    return CoreString.of(context)!.zero;
                  } else if (double.parse(
                          ConversionMethods.formattingValue(value.toString())) >
                      cryptoSingleBalance) {
                    validate = false;
                    return CoreString.of(context)!.youDont;
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              TotalInReal(valueController: valueController, widget: widget),
              SizedBox(height: MediaQuery.of(context).size.height * 0.32),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:
              validate ? magenta : const Color.fromARGB(255, 202, 200, 212),
          onPressed: () {
            if (_key.currentState!.validate()) {
              ConversionMethods.validation(cryptoRight, cryptoLeft, context,
                  valueController, widget.list);
            }
          },
          child: const Icon(Icons.navigate_next),
        ),
        bottomSheet: TotalContainer(
          total: ConversionMethods.getTotal(
              cryptoRight,
              ConversionMethods.convertLatestValue(
                  valueController.text, cryptoLeft)),
        ),
      ),
    );
  }
}
