import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  ];

  /// App title in app bar
  ///
  /// In en, this message translates to:
  /// **'DevVibe'**
  String get helloWorld;

  /// Welcome message for user
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcomeMessage;

  /// Settings section title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Dark theme toggle label
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkTheme;

  /// Language selection label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Authentication page title
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get authTitle;

  /// Authentication page subtitle
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue'**
  String get authSubtitle;

  /// Auth card title
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get authCardTitle;

  /// Auth card subtitle
  ///
  /// In en, this message translates to:
  /// **'Sign in with your account'**
  String get authCardSubtitle;

  /// Google sign in button text
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// Success message after authentication
  ///
  /// In en, this message translates to:
  /// **'Successfully signed in!'**
  String get authSuccess;

  /// Loading message during authentication
  ///
  /// In en, this message translates to:
  /// **'Signing in...'**
  String get authLoading;

  /// Divider text between options
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get authOr;

  /// First feature description
  ///
  /// In en, this message translates to:
  /// **'Secure authentication'**
  String get authFeature1;

  /// Second feature description
  ///
  /// In en, this message translates to:
  /// **'Fast and reliable'**
  String get authFeature2;

  /// Third feature description
  ///
  /// In en, this message translates to:
  /// **'Sync across devices'**
  String get authFeature3;

  /// Terms and privacy text
  ///
  /// In en, this message translates to:
  /// **'By signing in, you agree to our Terms & Privacy Policy'**
  String get authTerms;

  /// App tagline on splash screen
  ///
  /// In en, this message translates to:
  /// **'Your Development Companion'**
  String get splashTagline;

  /// Loading text on splash screen
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get splashLoading;

  /// Home page subtitle
  ///
  /// In en, this message translates to:
  /// **'Manage your preferences below'**
  String get homeSubtitle;

  /// Dark theme status
  ///
  /// In en, this message translates to:
  /// **'Dark mode enabled'**
  String get themeDarkEnabled;

  /// Light theme status
  ///
  /// In en, this message translates to:
  /// **'Light mode enabled'**
  String get themeLightEnabled;

  /// Quick actions section title
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// Notifications action
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Profile action
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Help action
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// About action
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Sign out button text
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
