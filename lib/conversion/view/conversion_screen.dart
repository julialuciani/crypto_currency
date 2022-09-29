import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/conversion/widgets/bottom_sheet_warning_user.dart';
import 'package:projeto_crypto/conversion/widgets/total_in_real.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/portifolio/usecase/cryptos_provider.dart';
import 'package:projeto_crypto/revision/revision_arguments/revision_arguments_screen.dart';
import 'package:projeto_crypto/shared/style/colors.dart';
import 'package:projeto_crypto/shared/templates/error_body.dart';
import 'package:projeto_crypto/shared/templates/loading_body.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';
import 'package:projeto_crypto/shared/utils/app_bar_default.dart';

import '../controller/cryptos_provider.dart';
import '../methods/conversion_screen_methods.dart';
import '../widgets/button_change_coin.dart';
import '../widgets/interactive_text.dart';
import '../widgets/list_tile_conversion.dart';
import '../widgets/total_container.dart';
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
    Future.delayed(Duration.zero, () {
      ref.watch(singleCryptoProvider.state).state = widget.crypto;
    });
    valueController.addListener(getLastestValue);
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

    return cryptos.when(
      data: (data) {
        return Form(
          key: _key,
          autovalidateMode: AutovalidateMode.always,
          child: Scaffold(
            appBar: const AppBarDefault(title: 'Converter'),
            body: bodyConversion(args, data, crypto, context),
            floatingActionButton:
                floatingActionButtonConversion(crypto, context),
            bottomSheet: TotalContainer(
              total: ConversionMethods.getTotal(
                  crypto,
                  ConversionMethods.convertLatestValue(
                      valueController, widget.crypto)),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return ErrorBody(onError: () {
          ref.refresh(cryptosProvider);
        });
      },
      loading: () {
        return const LoadingBody();
      },
    );
  }

  SingleChildScrollView bodyConversion(AppArguments args,
      List<CryptoViewData> data, CryptoViewData crypto, BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UpperAvailableBalanceContainer(
            crypto: args.crypto,
            singleBalance: args.singleBalance,
          ),
          const InteractiveText(),
          rowButtons(data, crypto),
          textFormFieldConversion(crypto, args),
          const SizedBox(height: 10),
          TotalInReal(valueController: valueController, widget: widget),
          SizedBox(height: MediaQuery.of(context).size.height * 0.32),
        ],
      ),
    );
  }

  Row rowButtons(List<CryptoViewData> data, CryptoViewData crypto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonChangeCoin(
          crypto: widget.crypto,
          data: data,
          listView: ListView.separated(
            separatorBuilder: (context, index) => const Divider(thickness: 1),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    widget.crypto = data[index];
                  });
                  Navigator.pop(context);
                },
                child: ListTileConversion(
                  name: data[index].name,
                  symbol: data[index].symbol.toUpperCase(),
                ),
              );
            },
          ),
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
        buttonChangeCoinMethod(crypto, data),
      ],
    );
  }

  FloatingActionButton floatingActionButtonConversion(
      CryptoViewData crypto, BuildContext context) {
    return FloatingActionButton(
      backgroundColor:
          validate ? magenta : const Color.fromARGB(255, 202, 200, 212),
      onPressed: () {
        if (_key.currentState!.validate()) {
          if (widget.crypto == crypto) {
            BottomSheetWarningUser(context);
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
                        valueController, widget.crypto)),
              ),
            );
            validate = true;
          }
        }
      },
      child: const Icon(Icons.navigate_next),
    );
  }

  TextFormField textFormFieldConversion(
      CryptoViewData crypto, AppArguments args) {
    return TextFormField(
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
        FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,6}')),
      ],
      onChanged: (value) {
        if (_key.currentState!.validate()) validate = true;
        setState(() {
          ConversionMethods.formatLatestValue(
              ConversionMethods.convertLatestValue(
                  valueController, widget.crypto));
          ConversionMethods.getTotal(
              crypto,
              ConversionMethods.convertLatestValue(
                  valueController, widget.crypto));
        });
      },
      validator: (value) {
        if (value == '' || value == null) {
          return 'Digite algo';
        } else if (ConversionMethods.isCorrect(value) ||
            value.startsWith('.')) {
          return "O valor não pode começar com caractere especial";
        } else if (double.parse(
                ConversionMethods.formattingValue(value.toString())) ==
            0) {
          validate = false;
          return 'Você não pode converter zero';
        } else if (double.parse(
                ConversionMethods.formattingValue(value.toString())) >
            args.singleBalance) {
          validate = false;
          return 'Você não tem essa quantia';
        } else {
          return null;
        }
      },
    );
  }

  ButtonChangeCoin buttonChangeCoinMethod(
      CryptoViewData crypto, List<CryptoViewData> data) {
    return ButtonChangeCoin(
      crypto: crypto,
      data: data,
      listView: ListView.separated(
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                ref.read(singleCryptoProvider.state).state = data[index];
              });
              Navigator.pop(context);
            },
            child: ListTileConversion(
              name: data[index].name,
              symbol: data[index].symbol.toUpperCase(),
            ),
          );
        },
      ),
    );
  }
}
