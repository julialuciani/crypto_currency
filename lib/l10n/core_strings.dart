import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'core_strings_en.dart';
import 'core_strings_pt.dart';

/// Callers can lookup localized strings with an instance of CoreString
/// returned by `CoreString.of(context)`.
///
/// Applications need to include `CoreString.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/core_strings.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CoreString.localizationsDelegates,
///   supportedLocales: CoreString.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the CoreString.supportedLocales
/// property.
abstract class CoreString {
  CoreString(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CoreString? of(BuildContext context) {
    return Localizations.of<CoreString>(context, CoreString);
  }

  static const LocalizationsDelegate<CoreString> delegate = _CoreStringDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @crypto.
  ///
  /// In pt, this message translates to:
  /// **'Cripto'**
  String get crypto;

  /// No description provided for @total.
  ///
  /// In pt, this message translates to:
  /// **'Valor total de moedas'**
  String get total;

  /// No description provided for @port.
  ///
  /// In pt, this message translates to:
  /// **'Portifólio'**
  String get port;

  /// No description provided for @move.
  ///
  /// In pt, this message translates to:
  /// **'Movimentos'**
  String get move;

  /// No description provided for @prices.
  ///
  /// In pt, this message translates to:
  /// **'Preço nos últimos {days} dias'**
  String prices(int days);

  /// No description provided for @variation.
  ///
  /// In pt, this message translates to:
  /// **'Variação nos últimos {days} dias'**
  String variation(int days);

  /// No description provided for @quant.
  ///
  /// In pt, this message translates to:
  /// **'Quantidade'**
  String get quant;

  /// No description provided for @value.
  ///
  /// In pt, this message translates to:
  /// **'Valor'**
  String get value;

  /// No description provided for @conv.
  ///
  /// In pt, this message translates to:
  /// **'Converter moeda'**
  String get conv;

  /// No description provided for @avai.
  ///
  /// In pt, this message translates to:
  /// **'Saldo disponível'**
  String get avai;

  /// No description provided for @how.
  ///
  /// In pt, this message translates to:
  /// **'Quanto você gostaria de converter?'**
  String get how;

  /// No description provided for @totEst.
  ///
  /// In pt, this message translates to:
  /// **'Total estimado'**
  String get totEst;

  /// No description provided for @review.
  ///
  /// In pt, this message translates to:
  /// **'Revise os dados da sua conversão'**
  String get review;

  /// No description provided for @convert.
  ///
  /// In pt, this message translates to:
  /// **'Converter'**
  String get convert;

  /// No description provided for @receive.
  ///
  /// In pt, this message translates to:
  /// **'Receber'**
  String get receive;

  /// No description provided for @exc.
  ///
  /// In pt, this message translates to:
  /// **'câmbio'**
  String get exc;

  /// No description provided for @comp.
  ///
  /// In pt, this message translates to:
  /// **'Concluir conversão'**
  String get comp;

  /// No description provided for @sucess.
  ///
  /// In pt, this message translates to:
  /// **'Conversão efetuada'**
  String get sucess;

  /// No description provided for @sucessM.
  ///
  /// In pt, this message translates to:
  /// **'Conversão de moeda efetuada com sucesso!'**
  String get sucessM;

  /// No description provided for @writeS.
  ///
  /// In pt, this message translates to:
  /// **'Digite algo'**
  String get writeS;

  /// No description provided for @theValue.
  ///
  /// In pt, this message translates to:
  /// **'O valor não pode começar com um caractere especial'**
  String get theValue;

  /// No description provided for @youDont.
  ///
  /// In pt, this message translates to:
  /// **'Você não tem essa quantia'**
  String get youDont;

  /// No description provided for @zero.
  ///
  /// In pt, this message translates to:
  /// **'Você não pode converter zero'**
  String get zero;

  /// No description provided for @details.
  ///
  /// In pt, this message translates to:
  /// **'Detalhes'**
  String get details;

  /// No description provided for @pick.
  ///
  /// In pt, this message translates to:
  /// **'Escolha uma moeda para converter'**
  String get pick;
}

class _CoreStringDelegate extends LocalizationsDelegate<CoreString> {
  const _CoreStringDelegate();

  @override
  Future<CoreString> load(Locale locale) {
    return SynchronousFuture<CoreString>(lookupCoreString(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_CoreStringDelegate old) => false;
}

CoreString lookupCoreString(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return CoreStringEn();
    case 'pt': return CoreStringPt();
  }

  throw FlutterError(
    'CoreString.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
