import 'core_strings.dart';

/// The translations for Portuguese (`pt`).
class CoreStringPt extends CoreString {
  CoreStringPt([String locale = 'pt']) : super(locale);

  @override
  String get crypto => 'Cripto';

  @override
  String get total => 'Valor total de moedas';

  @override
  String get port => 'Portifólio';

  @override
  String get move => 'Movimentos';

  @override
  String prices(int days) {
    return 'Preço nos últimos $days dias';
  }

  @override
  String variation(int days) {
    return 'Variação nos últimos $days dias';
  }

  @override
  String get quant => 'Quantidade';

  @override
  String get value => 'Valor';

  @override
  String get conv => 'Converter moeda';

  @override
  String get avai => 'Saldo disponível';

  @override
  String get how => 'Quanto você gostaria de converter?';

  @override
  String get totEst => 'Total estimado';

  @override
  String get review => 'Revise os dados da sua conversão';

  @override
  String get convert => 'Converter';

  @override
  String get receive => 'Receber';

  @override
  String get exc => 'câmbio';

  @override
  String get comp => 'Concluir conversão';

  @override
  String get sucess => 'Conversão efetuada';

  @override
  String get sucessM => 'Conversão de moeda efetuada com sucesso!';

  @override
  String get writeS => 'Digite algo';

  @override
  String get theValue => 'O valor não pode começar com um caractere especial';

  @override
  String get youDont => 'Você não tem essa quantia';

  @override
  String get zero => 'Você não pode converter zero';

  @override
  String get details => 'Detalhes';

  @override
  String get pick => 'Escolha uma moeda para converter';
}
