import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:projeto_crypto/conversion/controller/crypto_provider.dart';

import 'package:projeto_crypto/details/widgets/details_app_bar.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/portifolio/usecase/cryptos_provider.dart';
import 'package:projeto_crypto/shared/style/colors.dart';

import '../widgets/button_change_coin.dart';
import '../widgets/upper_container_conversion.dart';

class ConversionScreen extends StatefulHookConsumerWidget {
  static const route = '/conversion';
  CryptoViewData crypto;

  ConversionScreen({
    Key? key,
    required this.crypto,
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
  }

  @override
  void dispose() {
    valueController.dispose();
    super.dispose();
  }

  String getLastestValue() {
    String value = valueController.text;
    return value;
  }

  double convertLatestValue() {
    double value = 0.0;
    if (getLastestValue() == '') {
      value = 0.0;
    } else {
      value = double.parse(getLastestValue()) * widget.crypto.currentPrice;
    }
    return value;
  }

  String formatLatestValue() {
    String value =
        NumberFormat.simpleCurrency(locale: 'pt-br', decimalDigits: 2)
            .format(convertLatestValue());
    debugPrint(value);
    return value;
  }

  String getTotal(CryptoViewData crypto) {
    double total = convertLatestValue() / crypto.currentPrice;
    return '${total.toString()} ${crypto.symbol.toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    final cryptos = ref.watch(cryptosProvider);
    var crypto = ref.watch(cryptoProvider.state).state;

    return cryptos.when(
      data: (data) {
        return Form(
          key: _key,
          autovalidateMode: AutovalidateMode.always,
          child: Scaffold(
            appBar: const DetailsAppBar(
              title: 'Converter',
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UpperContainerConversion(widget: widget),
                  const SizedBox(height: 30),
                  const AutoSizeText(
                    'Quanto você gostaria de converter?',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonChangeCoin(
                        image: widget.crypto.image,
                        abbreviation: widget.crypto.symbol.toUpperCase(),
                      ),
                      IconButton(
                        icon: const Icon(Icons.compare_arrows, color: magenta),
                        onPressed: () {
                          CryptoViewData temp = widget.crypto;
                          setState(() {
                            widget.crypto = crypto;
                            ref.read(cryptoProvider.state).state = temp;
                          });
                        },
                      ),
                      ButtonChangeCoin(
                        image: crypto.image,
                        abbreviation: crypto.symbol.toUpperCase(),
                      ),
                    ],
                  ),
                  TextFormField(
                      showCursor: false,
                      controller: valueController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: magenta,
                            width: 3,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: magenta, width: 3)),
                        hintText: '${widget.crypto.symbol.toUpperCase()} 0,00',
                        hintStyle: TextStyle(
                          fontSize: 30,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          formatLatestValue();
                          getTotal(crypto);
                        });
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'(^\d*\.?\d*)')),
                      ],
                      onEditingComplete: getLastestValue,
                      validator: (value) {
                        if (value == '') {
                          validate = false;
                          return 'Digite algo';
                        } else if (double.parse(value!) == 0) {
                          validate = false;
                          return 'Você não pode converter zero';
                        } else if (double.parse(value) > 0.5) {
                          return 'Você não tem essa quantia';
                        } else {
                          validate = true;
                          return null;
                        }
                      }),
                  const SizedBox(height: 10),
                  Text(
                    formatLatestValue(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.32),
                  const Divider(thickness: 1),
                  Text(
                    'Total estimado',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 17),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    getTotal(crypto),
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor:
                  validate ? magenta : const Color.fromARGB(255, 202, 200, 212),
              onPressed: () {
                if (_key.currentState!.validate()) {
                  if (widget.crypto.symbol != crypto.symbol) {
                    validate = true;
                  } else {
                    validate = false;
                  }
                }
              },
              child: const Icon(Icons.navigate_next),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return const Text('Deu erro');
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
