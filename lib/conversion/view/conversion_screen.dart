import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/portifolio/controller/crypto_individual_balance_notifier.dart';
import '../../l10n/core_strings.dart';
import '../../portifolio/model/crypto_view_data.dart';
import '../../portifolio/usecase/cryptos_provider.dart';
import '../../revision/revision_arguments/revision_arguments_screen.dart';
import '../../shared/style/colors.dart';
import '../../shared/utils/app_arguments.dart';
import '../../shared/templates/app_bar_default.dart';
import '../controller/cryptos_provider.dart';
import '../methods/conversion_methods.dart';
import '../widgets/bottom_sheet_warning_user.dart';
import '../widgets/button_change_coin.dart';
import '../widgets/interactive_text.dart';
import '../widgets/total_container.dart';
import '../widgets/total_in_real.dart';
import '../widgets/upper_container_conversion.dart';

class ConversionScreen extends StatefulHookConsumerWidget {
  static const route = '/conversion';
  CryptoViewData crypto;
  final double singleBalance;

  ConversionScreen({
    Key? key,
    required this.crypto,
    required this.singleBalance,
  }) : super(key: key);

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
      ref.read(singleCryptoProvider.state).state = widget.crypto;
    });
  }

  String getLastestValue() {
    String value = valueController.text;

    return value;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as AppArguments;
    final cryptos = ref.watch(cryptosProvider);
    var crypto = ref.watch(singleCryptoProvider.state).state;
    var cryptoBalance = ref.read(singleBalanceProvider);

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
                crypto: args.crypto,
                singleBalance: cryptoBalance.elementAt(
                  cryptos.asData!.value.indexOf(widget.crypto),
                ),
              ),
              const InteractiveText(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonChangeCoin(
                    crypto: widget.crypto,
                    data: cryptos.asData!.value,
                    id: '1',
                  ),
                  IconButton(
                    icon: const Icon(Icons.compare_arrows, color: magenta),
                    onPressed: () {
                      CryptoViewData temp = widget.crypto;
                      setState(() {
                        widget.crypto = crypto;
                        ref.read(singleCryptoProvider.state).state = temp;
                      });
                    },
                  ),
                  ButtonChangeCoin(
                    crypto: crypto,
                    data: cryptos.asData!.value,
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
                  hintText: '${widget.crypto.symbol.toUpperCase()} 0.00',
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
                            valueController.text, widget.crypto));
                    ConversionMethods.getTotal(
                        crypto,
                        ConversionMethods.convertLatestValue(
                            valueController.text, widget.crypto));
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
                      args.singleBalance) {
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
              if (widget.crypto == crypto) {
                bottomSheetWarningUser(context);
              } else {
                Navigator.of(context).pushNamed(
                  '/revision',
                  arguments: RevisionArguments(
                    convertQuantity: valueController.text,
                    cryptoConvert: widget.crypto,
                    cryptoReceive: crypto,
                    receiveQuantity: ConversionMethods.getTotal(
                        crypto,
                        ConversionMethods.convertLatestValue(
                            valueController.text, widget.crypto)),
                    total: ConversionMethods.formatLatestValue(
                        ConversionMethods.convertLatestValue(
                            valueController.text, widget.crypto)),
                    discount: double.parse(valueController.text),
                    increase: ConversionMethods.convertLatestValue(
                        valueController.text, crypto),
                    idDiscount: widget.crypto.id,
                    idIncrease: crypto.id,
                  ),
                );
                validate = true;
              }
            }
          },
          child: const Icon(Icons.navigate_next),
        ),
        bottomSheet: TotalContainer(
          total: ConversionMethods.getTotal(
              crypto,
              ConversionMethods.convertLatestValue(
                  valueController.text, widget.crypto)),
        ),
      ),
    );
  }
}
