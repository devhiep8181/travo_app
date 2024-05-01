import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
    Locale('es'),
    Locale('vi'),
    Locale('zh')
  ];

  /// Text shown in the AppBar of the Counter Page
  ///
  /// In en, this message translates to:
  /// **'Counter'**
  String get counterAppBarTitle;

  /// No description provided for @subTitileHome.
  ///
  /// In en, this message translates to:
  /// **'Where are you going next?'**
  String get subTitileHome;

  /// No description provided for @searchText.
  ///
  /// In en, this message translates to:
  /// **'Search your destinat'**
  String get searchText;

  /// No description provided for @hotelModelText.
  ///
  /// In en, this message translates to:
  /// **'Hotels'**
  String get hotelModelText;

  /// No description provided for @flightsModelText.
  ///
  /// In en, this message translates to:
  /// **'Flights'**
  String get flightsModelText;

  /// No description provided for @allModelText.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allModelText;

  /// No description provided for @darkModeText.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkModeText;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Laguage'**
  String get changeLanguage;

  /// No description provided for @titleOnboard1.
  ///
  /// In en, this message translates to:
  /// **'Book a flight'**
  String get titleOnboard1;

  /// No description provided for @titleOnboard2.
  ///
  /// In en, this message translates to:
  /// **'Find a hotel room'**
  String get titleOnboard2;

  /// No description provided for @titleOnboard3.
  ///
  /// In en, this message translates to:
  /// **'Enjoy your trip'**
  String get titleOnboard3;

  /// No description provided for @subtitleOnboard1.
  ///
  /// In en, this message translates to:
  /// **'Found a flight that matches your destination and schedule? Book it instantly.'**
  String get subtitleOnboard1;

  /// No description provided for @subtitleOnboard2.
  ///
  /// In en, this message translates to:
  /// **'Select the day, book your room. We give you the best price.'**
  String get subtitleOnboard2;

  /// No description provided for @subtitleOnboard3.
  ///
  /// In en, this message translates to:
  /// **'Easy discovering new places and share these between your friends and travel together.'**
  String get subtitleOnboard3;

  /// No description provided for @skipText.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipText;

  /// No description provided for @getStartedText.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStartedText;

  /// No description provided for @nextText.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextText;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @loginText.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginText;

  /// No description provided for @subtitleLoginText.
  ///
  /// In en, this message translates to:
  /// **'Hi, Welcome back!'**
  String get subtitleLoginText;

  /// No description provided for @emailText.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailText;

  /// No description provided for @passwordText.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordText;

  /// No description provided for @remeberText.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get remeberText;

  /// No description provided for @forgotPasswordText.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPasswordText;

  /// No description provided for @btnLoginText.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get btnLoginText;

  /// No description provided for @orLoginText.
  ///
  /// In en, this message translates to:
  /// **'or log in with'**
  String get orLoginText;

  /// No description provided for @googleText.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get googleText;

  /// No description provided for @facebookText.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebookText;

  /// No description provided for @doNotAcountText.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get doNotAcountText;

  /// No description provided for @signUpText.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpText;

  /// No description provided for @subtitleSignUpText.
  ///
  /// In en, this message translates to:
  /// **'Let’s create your account!'**
  String get subtitleSignUpText;

  /// No description provided for @nameText.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameText;

  /// No description provided for @countryText.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get countryText;

  /// No description provided for @phoneNumberText.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberText;

  /// No description provided for @privacyPolicyText1.
  ///
  /// In en, this message translates to:
  /// **'By tapping sign up you agree to the '**
  String get privacyPolicyText1;

  /// No description provided for @privacyPolicyText2.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get privacyPolicyText2;

  /// No description provided for @privacyPolicyText3.
  ///
  /// In en, this message translates to:
  /// **' of this app'**
  String get privacyPolicyText3;

  /// No description provided for @termsText.
  ///
  /// In en, this message translates to:
  /// **'Terms and Condition'**
  String get termsText;

  /// No description provided for @privacyText.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyText;

  /// No description provided for @orSingUpText.
  ///
  /// In en, this message translates to:
  /// **'or sign up with'**
  String get orSingUpText;

  /// No description provided for @headingforgotPasswordText.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get headingforgotPasswordText;

  /// No description provided for @subtitleForgotPasswordText.
  ///
  /// In en, this message translates to:
  /// **'You’ll get messages soon on your e-mail address'**
  String get subtitleForgotPasswordText;

  /// No description provided for @btnSendText.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get btnSendText;

  /// No description provided for @hiText.
  ///
  /// In en, this message translates to:
  /// **'Hi, '**
  String get hiText;

  /// No description provided for @popularText.
  ///
  /// In en, this message translates to:
  /// **'Popular Destinations'**
  String get popularText;

  /// No description provided for @seeAllText.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAllText;

  /// No description provided for @profileText.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileText;

  /// No description provided for @searchHotel.
  ///
  /// In en, this message translates to:
  /// **'Search your hotel'**
  String get searchHotel;

  /// No description provided for @noConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection, please try again!'**
  String get noConnection;

  /// No description provided for @defaultErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again!'**
  String get defaultErrorMessage;

  /// No description provided for @homeLabel.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeLabel;

  /// No description provided for @favouriteLabel.
  ///
  /// In en, this message translates to:
  /// **'Favourite'**
  String get favouriteLabel;

  /// No description provided for @paymentLabel.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get paymentLabel;

  /// No description provided for @userLabel.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get userLabel;

  /// No description provided for @bookARoomText.
  ///
  /// In en, this message translates to:
  /// **'Book a room'**
  String get bookARoomText;

  /// No description provided for @chooseText.
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get chooseText;

  /// No description provided for @nightText.
  ///
  /// In en, this message translates to:
  /// **'/night'**
  String get nightText;

  /// No description provided for @reviewsText.
  ///
  /// In en, this message translates to:
  /// **'reviews'**
  String get reviewsText;

  /// No description provided for @selectedRoomText.
  ///
  /// In en, this message translates to:
  /// **'Selected Room'**
  String get selectedRoomText;

  /// No description provided for @selectRoomText.
  ///
  /// In en, this message translates to:
  /// **'Select Room'**
  String get selectRoomText;

  /// No description provided for @locationText.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationText;

  /// No description provided for @infomationText.
  ///
  /// In en, this message translates to:
  /// **'Infomation'**
  String get infomationText;

  /// No description provided for @keyTitle.
  ///
  /// In en, this message translates to:
  /// **'title'**
  String get keyTitle;

  /// No description provided for @keySubtitle.
  ///
  /// In en, this message translates to:
  /// **'subtitle'**
  String get keySubtitle;

  /// No description provided for @keyColor.
  ///
  /// In en, this message translates to:
  /// **'color'**
  String get keyColor;

  /// No description provided for @keyImage.
  ///
  /// In en, this message translates to:
  /// **'image'**
  String get keyImage;

  /// No description provided for @checkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkoutTitle;

  /// No description provided for @bookAndReviewText.
  ///
  /// In en, this message translates to:
  /// **'Book and Review'**
  String get bookAndReviewText;

  /// No description provided for @paymentBookingText.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get paymentBookingText;

  /// No description provided for @confirmText.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmText;

  /// No description provided for @contactDetailText.
  ///
  /// In en, this message translates to:
  /// **'Contact Details'**
  String get contactDetailText;

  /// No description provided for @addContactBtnText.
  ///
  /// In en, this message translates to:
  /// **'Add Contact'**
  String get addContactBtnText;

  /// No description provided for @promoCodeText.
  ///
  /// In en, this message translates to:
  /// **'Promo Code'**
  String get promoCodeText;

  /// No description provided for @addPromoCodeBtnText.
  ///
  /// In en, this message translates to:
  /// **'Add Code'**
  String get addPromoCodeBtnText;

  /// No description provided for @addDateBtnText.
  ///
  /// In en, this message translates to:
  /// **'Add Date'**
  String get addDateBtnText;

  /// No description provided for @addCouponCodeText.
  ///
  /// In en, this message translates to:
  /// **'Coupon Code'**
  String get addCouponCodeText;

  /// No description provided for @addCodeBtnText.
  ///
  /// In en, this message translates to:
  /// **'Add Promo Code'**
  String get addCodeBtnText;

  /// No description provided for @bookingDateText.
  ///
  /// In en, this message translates to:
  /// **'Booking Date'**
  String get bookingDateText;

  /// No description provided for @checkInText.
  ///
  /// In en, this message translates to:
  /// **'Check-in'**
  String get checkInText;

  /// No description provided for @checkOutText.
  ///
  /// In en, this message translates to:
  /// **'Check-out'**
  String get checkOutText;

  /// No description provided for @subtitileEmail.
  ///
  /// In en, this message translates to:
  /// **'E-ticket will be sent to your E-mail'**
  String get subtitileEmail;

  /// No description provided for @doneBtnText.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get doneBtnText;

  /// No description provided for @miniMarketText.
  ///
  /// In en, this message translates to:
  /// **'Mini Market'**
  String get miniMarketText;

  /// No description provided for @creditCardText.
  ///
  /// In en, this message translates to:
  /// **'Credit / Debit Card'**
  String get creditCardText;

  /// No description provided for @bankTransferText.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get bankTransferText;

  /// No description provided for @cardNumberText.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get cardNumberText;

  /// No description provided for @addCardBtnText.
  ///
  /// In en, this message translates to:
  /// **'Add Card'**
  String get addCardBtnText;

  /// No description provided for @payNowBtnText.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNowBtnText;

  /// No description provided for @totalText.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalText;

  /// No description provided for @changeText.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get changeText;

  /// No description provided for @taxesAndFees.
  ///
  /// In en, this message translates to:
  /// **'Taxes and Fees'**
  String get taxesAndFees;

  /// No description provided for @roomBookingText.
  ///
  /// In en, this message translates to:
  /// **'Room Booking'**
  String get roomBookingText;

  /// No description provided for @roomBookingSubtitleText.
  ///
  /// In en, this message translates to:
  /// **'Choose your favorite hotel and enjoy the service'**
  String get roomBookingSubtitleText;

  /// No description provided for @searchBtnText.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchBtnText;

  /// No description provided for @destinationText.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get destinationText;

  /// No description provided for @selectedDateText.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectedDateText;

  /// No description provided for @guestAndRoom.
  ///
  /// In en, this message translates to:
  /// **'Guest and Room'**
  String get guestAndRoom;

  /// No description provided for @selectBtnText.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get selectBtnText;

  /// No description provided for @cancelBtnText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelBtnText;

  /// No description provided for @addGuestRoom.
  ///
  /// In en, this message translates to:
  /// **'Add guest and room'**
  String get addGuestRoom;

  /// No description provided for @guestText.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guestText;

  /// No description provided for @roomText.
  ///
  /// In en, this message translates to:
  /// **'Room'**
  String get roomText;

  /// No description provided for @bookYourFlightText.
  ///
  /// In en, this message translates to:
  /// **'Book Your Flight'**
  String get bookYourFlightText;

  /// No description provided for @oneWayText.
  ///
  /// In en, this message translates to:
  /// **'One way'**
  String get oneWayText;

  /// No description provided for @roundTripText.
  ///
  /// In en, this message translates to:
  /// **'Round Trip'**
  String get roundTripText;

  /// No description provided for @multiCityText.
  ///
  /// In en, this message translates to:
  /// **'Multi-City'**
  String get multiCityText;

  /// No description provided for @fromText.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get fromText;

  /// No description provided for @toText.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get toText;

  /// No description provided for @departureText.
  ///
  /// In en, this message translates to:
  /// **'Departure'**
  String get departureText;

  /// No description provided for @returnText.
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get returnText;

  /// No description provided for @selectDateText.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDateText;

  /// No description provided for @passengersText.
  ///
  /// In en, this message translates to:
  /// **'Passengers'**
  String get passengersText;

  /// No description provided for @classText.
  ///
  /// In en, this message translates to:
  /// **'Class'**
  String get classText;

  /// No description provided for @flight1Text.
  ///
  /// In en, this message translates to:
  /// **'Flight 1'**
  String get flight1Text;

  /// No description provided for @flight2Text.
  ///
  /// In en, this message translates to:
  /// **'Flight 2'**
  String get flight2Text;

  /// No description provided for @arriveText.
  ///
  /// In en, this message translates to:
  /// **'Arrive'**
  String get arriveText;

  /// No description provided for @flightNoText.
  ///
  /// In en, this message translates to:
  /// **'Flight No.'**
  String get flightNoText;

  /// No description provided for @selectSeatText.
  ///
  /// In en, this message translates to:
  /// **'Select Seat'**
  String get selectSeatText;

  /// No description provided for @seatText.
  ///
  /// In en, this message translates to:
  /// **'Seat'**
  String get seatText;

  /// No description provided for @economyClassText.
  ///
  /// In en, this message translates to:
  /// **'Economy Class'**
  String get economyClassText;

  /// No description provided for @bussinessClassText.
  ///
  /// In en, this message translates to:
  /// **'Bussiness Class'**
  String get bussinessClassText;

  /// No description provided for @processeText.
  ///
  /// In en, this message translates to:
  /// **'Processe'**
  String get processeText;

  /// No description provided for @airlineText.
  ///
  /// In en, this message translates to:
  /// **'Airline'**
  String get airlineText;

  /// No description provided for @dateText.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateText;

  /// No description provided for @gateText.
  ///
  /// In en, this message translates to:
  /// **'Gate'**
  String get gateText;

  /// No description provided for @boardingTimeText.
  ///
  /// In en, this message translates to:
  /// **'Boarding Time'**
  String get boardingTimeText;

  /// No description provided for @addPassengerText.
  ///
  /// In en, this message translates to:
  /// **'Add Passenger'**
  String get addPassengerText;

  /// No description provided for @addClassFlightText.
  ///
  /// In en, this message translates to:
  /// **'Add Class'**
  String get addClassFlightText;

  /// No description provided for @identityNumberText.
  ///
  /// In en, this message translates to:
  /// **'Identity Number'**
  String get identityNumberText;

  /// No description provided for @selectedLocationText.
  ///
  /// In en, this message translates to:
  /// **'Choose a Location'**
  String get selectedLocationText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'vi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'vi': return AppLocalizationsVi();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
