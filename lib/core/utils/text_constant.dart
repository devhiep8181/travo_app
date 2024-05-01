class TextConstant {
  TextConstant._();
  static String inputEmpty = 'Cannot be empty';
  static RegExp validateEmail =
      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  static String emailError = 'Invalid email';
  static String passwordError = 'Password must be at least 6 characters long';
  static String passwordError2 =
      'Password must contain 1 uppercase letter and 1 special character';
  static RegExp validatePassword =
      RegExp(r'(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>])');

  //! Text Onboarding
  //title
  static String titleOnboard1 = 'Book a flight';
  static String titleOnboard2 = 'Find a hotel room';
  static String titleOnboard3 = 'Enjoy your trip';

  //subtitle
  static String subtitleOnboard1 =
      'Found a flight that matches your destination and schedule? Book it instantly.';
  static String subtitleOnboard2 =
      'Select the day, book your room. We give you the best price.';
  static String subtitleOnboard3 =
      'Easy discovering new places and share these between your friends and travel together.';

  //text onboarding screen
  static String skipText = 'Skip';
  static String getStartedText = 'Get Started';
  static String nextText = 'Next';

  //text login, signUp screen, forgot screen
  static String logout = 'Logout';
  static String loginText = 'Login';
  static String subtitleLoginText = 'Hi, Welcome back!';
  static String emailText = 'Email';
  static String passwordText = 'Password';
  static String remeberText = 'Remember me';
  static String forgotPasswordText = 'Forgot password?';
  static String btnLoginText = 'Log In';
  static String orLoginText = 'or log in with';
  static String googleText = 'Google';
  static String facebookText = 'Facebook';
  static String doNotAcountText = 'Don’t have an account?';
  static String signUpText = 'Sign Up';
  //
  static String subtitleSignUpText = 'Let’s create your account!';
  static String nameText = 'Name';
  static String countryText = 'Country';
  static String phoneNumberText = 'Phone Number';
  static String privacyPolicyText1 = 'By tapping sign up you agree to the ';
  static String privacyPolicyText2 = ' and ';
  static String privacyPolicyText3 = '  of this app';
  static String termsText = 'Terms and Condition';
  static String privacyText = 'Privacy Policy';
  static String orSingUpText = 'or sign up with';
  static String headingforgotPasswordText = 'Forgot Password';
  static String subtitleForgotPasswordText =
      'You’ll get messages soon on your e-mail address';
  static String btnSendText = 'Send';

  //Colection
  static String bookingCollection = 'booking';
  static String bookingFlightCollection = 'booking_flight';
  static String flightCollection = 'flight';
  static String hotelCollection = 'hotel';
  static String placeCollection = 'place';
  static String promoCollection = 'promo';
  static String ratingCollection = 'review';
  static String roomCollection = 'room';
  static String serviceCollection = 'service';
  static String userCollection = 'user';
  static String reactSubCollection = 'react';

  //text home screen
  static String hiText = 'Hi, ';
  static String nameUserText = 'James'; //tạm thời set mặc định để làm UI
  static String exclamationMark = '!';
  static String titileHomeText = 'Hi, ';
  static String subTitileHome = 'Where are you going next?';
  static String searchText = 'Search your destinat';
  static String hotelModelText = 'Hotels';
  static String flightsModelText = 'Flights';
  static String allModelText = 'All';
  static String popularText = 'Popular Destinations';
  static String seeAllText = 'See All';
  static String profileText = 'Profile';
  static String searchHotel = 'Search your hotel';

  //Error
  static String noConnection = 'No internet connection, please try again!';
  static String defaultErrorMessage = 'An error occurred, please try again!';

  //label
  static String homeLabel = 'Home';
  static String favouriteLabel = 'Favourite';
  static String paymentLabel = 'Payment';
  static String userLabel = 'User';

  //Key map navbarItem
  static String indexKey = 'index';
  static String labelKey = 'label';
  static String iconKey = 'icon';
  static String routeKey = 'route';

  //Hotel screen
  static String bookARoomText = 'Book a room';
  static String chooseText = 'Choose';
  static String nightText = '/night';
  static String reviewsText = 'reviews';

  //Detail Hotel Screen
  static String selectedRoomText = 'Selected Room';
  static String selectRoomText = 'Select Room';

  static String locationText = 'Location';
  static String infomationText = 'Infomation';

  //Select Room Data
  static String keyTitle = 'title';
  static String keySubtitle = 'subtitle';
  static String keyColor = 'color';
  static String keyImage = 'image';

  //Booking Module
  static String checkoutTitle = 'Checkout';
  static String bookAndReviewText = 'Book and Review';
  static String paymentBookingText = 'Payment';
  static String confirmText = 'Confirm';
  static String contactDetailText = 'Contact Details';
  static String addContactBtnText = 'Add Contact';
  static String promoCodeText = 'Promo Code';
  static String addPromoCodeBtnText = 'Add Code';
  static String addDateBtnText = 'Add Date';
  static String addCouponCodeText = 'Coupon Code';

  static String addCodeBtnText = 'Add Promo Code';
  static String bookingDateText = 'Booking Date';
  static String checkInText = 'Check-in';
  static String checkOutText = 'Check-out';
  static String subtitileEmail = 'E-ticket will be sent to your E-mail';
  static String doneBtnText = 'Done';
  static String miniMarketText = 'Mini Market';
  static String creditCardText = 'Credit / Debit Card';
  static String bankTransferText = 'Bank Transfer';
  static String cardNumberText = 'Card Number';
  static String addCardBtnText = 'Add Card';
  static String payNowBtnText = 'Pay Now';

  static String totalText = 'Total';
  static String changeText = 'Change';
  static String taxesAndFees = 'Taxes and Fees';

  static String roomBookingText = 'Room Booking';
  static String roomBookingSubtitleText =
      'Choose your favorite hotel and enjoy the service';
  static String searchBtnText = 'Search';
  static String destinationText = 'Destination';
  static String selectedDateText = 'Select Date';
  static String guestAndRoom = 'Guest and Room';
  static String selectBtnText = 'Select';
  static String cancelBtnText = 'Cancel';
  static String addGuestRoom = 'Add guest and room';
  static String guestText = 'Guest';
  static String roomText = 'Room';

  //
  static String darkModeText = 'Dark Mode';
  static String changeLanguage = 'Change Laguage';

  static String freeCancellationText = 'Free Cancellation';
  static String bedText = '2 King Bed';

  //key
  static String keyContact = 'Contact';
  static String keyUid = 'KeyUid';
  static String keyBooking = 'Booking';
  static String keyFavourite = 'Favourite';

  static String keyDepatureFlight1 = 'DepatureFlight1';
  static String keyDepatureFlight2 = 'DepatureFlight2';

  static String keyLocationFlight1 = 'LoacationFlight1';
  static String keyLocationFlight2 = 'LocationFlight2';

  //Flight
  static String keyTitleCheckOutFlight1 = 'TitleCheckOutFlight1';
  static String keyTitleCheckOutFlight2 = 'TitleCheckOutFlight2';

  //Clas flight
  static String classBusiness = 'Bussiness Class';
  static String classEconomy = 'Economy Class';

  //Image random avatar
  static String imageUser = 'https://loremflickr.com/640/640/cat';
}
