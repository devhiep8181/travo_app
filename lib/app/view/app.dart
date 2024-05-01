// Flutter imports:

// Flutter imports:


import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../core/app_export.dart';
import '../../l10n/app_localizations.dart';
import '../../presentation/auth/authen/auth_bloc.dart';
import '../../presentation/auth/user/user_bloc.dart';
import '../../presentation/booking/book_and_review/blocs/choose_date/choose_date_bloc.dart';
import '../../presentation/booking/book_and_review/blocs/choose_guest/choose_guest_bloc.dart';
import '../../presentation/booking/book_and_review/blocs/choose_room/choose_room_bloc.dart';
import '../../presentation/booking/book_and_review/blocs/contact/contact_bloc.dart';
import '../../presentation/booking/book_and_review/blocs/contact_details/contact_details_bloc.dart';
import '../../presentation/booking/book_and_review/blocs/promo/promo_bloc.dart';
import '../../presentation/booking/book_and_review/blocs/room/room_choose_bloc.dart';
import '../../presentation/booking/confirm/booking/booking_bloc.dart';
import '../../presentation/booking/payment/bloc/bloc/card_bloc.dart';
import '../../presentation/booking/payment/bloc/choose_card/bloc/choose_card_bloc.dart';
import '../../presentation/booking_flight/blocs/confirm_flight/confirm_flight_bloc.dart';
import '../../presentation/booking_flight/blocs/flight/flight_bloc.dart';
import '../../presentation/booking_flight/check_out_flight/blocs/add_passengers/add_passenger_bloc.dart';
import '../../presentation/booking_flight/select_seat/blocs/chooose_class_flight/choose_class_flight_bloc.dart';
import '../../presentation/booking_flight/select_seat/blocs/choose_date_flight/choose_date_flight_bloc.dart';
import '../../presentation/booking_flight/select_seat/blocs/choose_location/choose_location_bloc.dart';
import '../../presentation/booking_flight/select_seat/blocs/choose_passengers/choose_passengers_bloc.dart';
import '../../presentation/booking_flight/select_seat/blocs/choose_seat/choose_seat_bloc.dart';
import '../../presentation/booking_flight/select_seat/blocs/seat/seat_bloc.dart';
import '../../presentation/home/bloc/favourite_home/favourite_home_bloc.dart';
import '../../presentation/home/bloc/place/place_bloc.dart';
import '../../presentation/hotel/blocs/hotel/hotel_bloc.dart';
import '../../presentation/hotel/blocs/review/review_bloc.dart';
import '../../presentation/hotel/blocs/room/room_bloc.dart';
import '../../presentation/hotel/review_hotel/blocs/count_rating/count_rating_bloc.dart';
import '../../presentation/hotel/review_hotel/blocs/count_react/count_react_bloc.dart';
import '../../presentation/hotel/review_hotel/blocs/modify_review/modify_review_bloc.dart';
import '../../presentation/hotel/review_hotel/blocs/photo/photo_bloc.dart';
import '../../presentation/hotel/review_hotel/blocs/react/react_bloc.dart';
import '../../presentation/hotel/select_room/blocs/bloc/id_room_bloc.dart';
import '../../presentation/login/blocs/bloc/account_bloc.dart';
import '../../presentation/payment/blocs/modify_or_choose_flight/modify_or_choose_flight_bloc.dart';
import '../../presentation/payment/blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';
import '../../presentation/signup/blocs/country/country_bloc.dart';
import '../../presentation/signup/blocs/country_phone_number/country_phone_number_bloc.dart';
import '../../presentation/signup/blocs/create_user/create_user_bloc.dart';
import '../../routes/app_routes.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_data.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    //Chỉnh status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ColorConstant.primaryColor));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //size samsung s7
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(verifyUserUseCase: context.read())),
          BlocProvider(
              create: (context) =>
                  CreateUserBloc(createUserUsecase: context.read())),
          BlocProvider(create: (_) => AccountBloc()),
          BlocProvider(create: (_) => CountryPhoneNumberBloc()),
          BlocProvider(
              create: (context) => UserBloc(getUserUseCase: context.read())),
          BlocProvider(
              create: (context) => PlaceBloc(getPlaceUseCase: context.read())),
          BlocProvider(create: (_) => FavouriteHomeBloc()),
          BlocProvider(
              create: (context) => HotelBloc(getHotelUsecase: context.read())),
          BlocProvider(
              create: (context) => RoomBloc(getRoomUseCase: context.read())),
          BlocProvider(
              create: (context) =>
                  FlightBloc(getFlightUseCase: context.read())),
          BlocProvider(
              create: (context) => PromoBloc(getPromoUseCase: context.read())),
          BlocProvider(
              create: (context) => ConfirmFlightBloc(
                    bookingFlightUseCase: context.read(),
                    getBookingFlightUseCase: context.read(),
                    updateBookingFlightUseCase: context.read(),
                    deleteBookingFlightUseCase: context.read(),
                  )),
          BlocProvider(create: (context) => ContactBloc()),
          BlocProvider(create: (_) => RoomChooseBloc()),
          BlocProvider(create: (_) => IdRoomBloc()),
          BlocProvider(create: (_) => ContactDetailsBloc()),
          BlocProvider(create: (_) => CardBloc()),
          BlocProvider(create: (_) => ChooseDateBloc()),
          BlocProvider(
              create: (context) => BookingBloc(
                  getBookingRoomUsecase: context.read(),
                  updateBookingRoomUseCase: context.read(),
                  deleteBookingRoomUseCase: context.read())),
          BlocProvider(create: (_) => AppBloc()),
          BlocProvider(create: (_) => CountryBloc()),
          BlocProvider(create: (_) => ChooseGuestBloc()),
          BlocProvider(create: (_) => ChooseRoomBloc()),
          BlocProvider(create: (_) => ChooseCardBloc()),
          BlocProvider(create: (_) => SeatBloc()),
          BlocProvider(create: (_) => ChooseSeatBloc()),
          BlocProvider(create: (_) => ChooseLocationBloc()),
          BlocProvider(create: (_) => ChooseDateFlightBloc()),
          BlocProvider(create: (_) => ChoosePassengersBloc()),
          BlocProvider(create: (_) => ChooseClassFlightBloc()),
          BlocProvider(create: (_) => AddPassengerBloc()),
          BlocProvider(create: (_) => ModifyOrChooseRoomBloc()),
          BlocProvider(create: (_) => ModifyOrChooseFlightBloc()),
          BlocProvider(
              create: (context) => ReviewBloc(
                    getReviewUseCase: context.read(),
                    pushReviewUseCase: context.read(),
                    deleteReviewUseCase: context.read(),
                    updateReviewUseCase: context.read(),
                  )),
          BlocProvider(
              create: (_) => CountReactBloc(
                  updateReactUseCase: context.read(),
                  pushValueReactUseCase: context.read())),
          BlocProvider(create: (_) => CountRatingBloc()),
          BlocProvider(create: (_) => ModifyReviewBloc()),
          BlocProvider(create: (_) => PhotoBloc()),
          BlocProvider(
              create: (context) => ReactBloc(
                  deleteValueReactUseCase: context.read(),
                  getValueReactUseCase: context.read(),
                  pushValueReactUseCase: context.read(),
                  updateValueReactUseCase: context.read())),
        ],
        // child: const MaterialApp(
        //   home: CallDataTest(),
        // )
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              //locale: DevicePreview.locale(context),
              locale:
                  languageData[state.valueCheckLanguage.toString()] as Locale,
              //builder: DevicePreview.appBuilder,
              theme: themeData[state.valueCheckTheme.toString()] as ThemeData,
              //darkTheme: AppTheme.darkTheme,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: router,
            );
          },
        ),
      ),
    );
  }
}



//  Rapidash:
//                      :`./
//                     _|  ,-
//                ,'""'    ,`
//              ,'.\       `.    __  ,.-.
//           . ./ `'    __  '. ,'  \ `.|
//           \\  \   ."'  L   "     `" `\                          _,-.
//            \` |\.`      7     .,   :._|   --'`.                 ` |
//           ` \`+ `'\      \^--"  `. |    ,'     `.            ,..' |
//            | ,.    |              ` `.  |    ..  '.          |    /
//            ':T'     '.    ,..      \  `-+`"-'  `._ \     -`,- ..,'
//           /        / `-,-'  ,'`.    `.   ; .--'   `+    '.   | ,
//          /     _..     .   `-.  \,.   `-'  '.  `.^  `".__|   ' |
//         '   , / |       `.   \    |        ,'     \           /
//          `"' " .         \   |  __ \    ,-'       `----.   _,'
//               /           |  `"' _} `""'                `-'
//              /.'         /     .-.         ,".
//      .._,.  /           /     '-.,'    ,'-. .'.
//     /  `. \/             `-.      `.   /`.  :
//    /  __ `.'                '-.     `-+_.'  .'          ,__
//   / .'  `.___                  `,..__      <__          \ (
//  / /       "..   /                   `-.     .' .-'"`--.'  \
// /  |       /-'  /                       \ ,._|  |          /'
// \.'|+.+.  (`..,'                         \`._ _,'           \__
//  \ |||| \ _`.^ `.            .            |  "    .'`"-.       `.
//   `+'|/ `( \'    `-....__    |            |._,".,'     `,        |
//                          `:-.|            `           ..'   ,'`.,-
//                           |  |            |`.        '-..    . /
//                           '  |           /  /           `.   |
//                            ` '          /  ',.         ,     `._
//                             \|        ,'   \'|         :  __    '
//                              `,     ,`     .._`..       `'  `-,.`.
//                        _`'`".  `.   ``-._ /   F   )        ,._\ `
//                       '-"'`, \   \ ,. ).-'-.^,|_,'         `  '.
//                           '.. \___j  `"'               ,..  | .'
//                              \            ___       ,. `\ \,+-'
//                               7.._   .--+`.  |_    |  `,'
//                            _,'  .'`--'  '    7 ` v.-
//                          ."._  /-.  -.   \.^-`
//                        .'  __+'...`'  `--'
//                         `"" ⠀⠀
