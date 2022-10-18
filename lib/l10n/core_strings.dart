import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'core_strings_en.dart';
import 'core_strings_es.dart';
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
  CoreString(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CoreString? of(BuildContext context) {
    return Localizations.of<CoreString>(context, CoreString);
  }

  static const LocalizationsDelegate<CoreString> delegate =
      _CoreStringDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt')
  ];

  /// First text on the upper side of the first screen
  ///
  /// In en, this message translates to:
  /// **'Crypto'**
  String get crypto;

  /// Phrase below the balance of the user
  ///
  /// In en, this message translates to:
  /// **'Total crypto wealth'**
  String get total;

  /// Name of the first screen on BottomBar
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get port;

  /// Name of the second screen on the BottomBar
  ///
  /// In en, this message translates to:
  /// **'Movements'**
  String get move;

  /// No description provided for @prices.
  ///
  /// In en, this message translates to:
  /// **'Price in the last {days} days'**
  String prices(int days);

  /// No description provided for @variation.
  ///
  /// In en, this message translates to:
  /// **'Variation in the last {days} days'**
  String variation(int days);

  /// Is next to the quantity that the user has of that coin on Details Screen
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quant;

  /// Is next to the value in money that the user have of that coin
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// Is the text of the button to go to Conversion Screen
  ///
  /// In en, this message translates to:
  /// **'Convert coin'**
  String get conv;

  /// Is next to the ammount of balance that the user has
  ///
  /// In en, this message translates to:
  /// **'Available balance'**
  String get avai;

  /// Is on the inractive text that asks the user how much he wants to convert
  ///
  /// In en, this message translates to:
  /// **'How much would you like to convert?'**
  String get how;

  /// Is above the estimated value on the coin the user is converting to
  ///
  /// In en, this message translates to:
  /// **'Estimated total'**
  String get totEst;

  /// Is the interactive text that asks the user to review his conversion data
  ///
  /// In en, this message translates to:
  /// **'Review your conversion data'**
  String get review;

  /// Is next to the value that the user wants to convert
  ///
  /// In en, this message translates to:
  /// **'Convert'**
  String get convert;

  /// Is next to the value that the user will increase by the convertion
  ///
  /// In en, this message translates to:
  /// **'Receive'**
  String get receive;

  /// Next to the comparation between one of the converted coin to the increased coin
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exc;

  /// Text on the button to complete the conversion
  ///
  /// In en, this message translates to:
  /// **'Complete conversion'**
  String get comp;

  /// Text below the checked icon on sucess page that shows the conversion was madeSucess phrase below the text and the icon check
  ///
  /// In en, this message translates to:
  /// **'Conversion performed'**
  String get sucess;

  /// Sucess phrase below the text and the icon check
  ///
  /// In en, this message translates to:
  /// **'Conversion made successfully!'**
  String get sucessM;

  /// Says to user type something when textFormField is empty
  ///
  /// In en, this message translates to:
  /// **'Type something'**
  String get writeS;

  /// Warning Messenger that says the value cannot start with a special character
  ///
  /// In en, this message translates to:
  /// **'Value cannot start with special character'**
  String get theValue;

  /// Warning message that says that the user doesn't have this coin ammount
  ///
  /// In en, this message translates to:
  /// **'You don\'t have this ammount'**
  String get youDont;

  /// Warning message that says to user that he can't convert 0
  ///
  /// In en, this message translates to:
  /// **'You can\'t convert zero'**
  String get zero;

  /// modal bottom sheet text
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @sense.
  ///
  /// In en, this message translates to:
  /// **'Doesn\'t make sense convert the same coin'**
  String get sense;

  /// Text on modal sheet that says to user pick a crypto to convert
  ///
  /// In en, this message translates to:
  /// **'Choose a crypto to convert'**
  String get pick;
}

class _CoreStringDelegate extends LocalizationsDelegate<CoreString> {
  const _CoreStringDelegate();

  @override
  Future<CoreString> load(Locale locale) {
    return SynchronousFuture<CoreString>(lookupCoreString(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_CoreStringDelegate old) => false;
}

CoreString lookupCoreString(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return CoreStringEn();
    case 'es':
      return CoreStringEs();
    case 'pt':
      return CoreStringPt();
  }

  throw FlutterError(
      'CoreString.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
