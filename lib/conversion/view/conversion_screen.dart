import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/portifolio/usecase/cryptos_provider.dart';
import 'package:projeto_crypto/shared/style/colors.dart';
import 'package:projeto_crypto/shared/templates/error_body.dart';
import 'package:projeto_crypto/shared/templates/loading_body.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';
import 'package:projeto_crypto/shared/utils/app_bar_default.dart';

import '../controller/cryptos_provider.dart';
import '../widgets/button_change_coin.dart';
import '../widgets/interactive_text.dart';
import '../widgets/upper_container_conversion.dart';

class ConversionScreen extends StatefulHookConsumerWidget {
  static const route = '/conversion';
  CryptoViewData crypto;
  double singleBalance;

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

  @override
  void dispose() {
    valueController.dispose();
    super.dispose();
  }

  String formattingValue(String value) {
    return value.replaceAll(RegExp(r'[^\w\s]+'), '.');
  }

  String getLastestValue() {
    String value = formattingValue(valueController.text);

    return value;
  }

  bool isCorrect(String value) {
    return value.startsWith(RegExp(r'[!@#$%^&*().,?":{}|<>]'));
  }

  double convertLatestValue() {
    double value = 0.0;
    if (getLastestValue() == '' || getLastestValue() == '.') {
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
    return value;
  }

  String getTotal(CryptoViewData crypto) {
    if (convertLatestValue() == 0.0) {
      return '0.00 ${crypto.symbol.toUpperCase()}';
    }
    double total = convertLatestValue() / crypto.currentPrice;
    return '${total.toStringAsFixed(10)} ${crypto.symbol.toUpperCase()}';
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
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UpperAvailableBalanceContainer(
                    crypto: args.crypto,
                    singleBalance: args.singleBalance,
                  ),
                  const InteractiveText(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonChangeCoin(
                        crypto: widget.crypto,
                        data: data,
                        listView: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const Divider(thickness: 1),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  widget.crypto = data[index];
                                });
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                title: Text(data[index].symbol.toUpperCase()),
                                subtitle: Text(data[index].name),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey.shade500,
                                ),
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
                      ButtonChangeCoin(
                        crypto: crypto,
                        data: data,
                        listView: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const Divider(thickness: 1),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  ref.read(singleCryptoProvider.state).state =
                                      data[index];
                                });
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                title: Text(data[index].symbol.toUpperCase()),
                                subtitle: Text(data[index].name),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            );
                          },
                        ),
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
                        formatLatestValue();
                        getTotal(crypto);
                      });
                    },
                    validator: (value) {
                      if (value == '' || value == null) {
                        return 'Digite algo';
                      } else if (isCorrect(value) || value.startsWith('.')) {
                        return "O valor não pode começar com caractere especial";
                      } else if (double.parse(
                              formattingValue(value.toString())) ==
                          0) {
                        validate = false;
                        return 'Você não pode converter zero';
                      } else if (double.parse(
                              formattingValue(value.toString())) >
                          args.singleBalance) {
                        validate = false;
                        return 'Você não tem essa quantia';
                      } else {
                        return null;
                      }
                    },
                  ),
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
                  if (widget.crypto == crypto) {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 100,
                          child: Center(
                            child: Text(
                              'Não faz sentido converter duas moedas iguais',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    Navigator.of(context).pushNamed('/revision',
                        arguments: AppArguments(
                            crypto: args.crypto,
                            singleBalance: args.singleBalance));
                    validate = true;
                  }
                }
              },
              child: const Icon(Icons.navigate_next),
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
}
