// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../core/utils/name_route.dart';
import '../domain/entities/hotel_entity.dart';
import '../presentation/booking/book_and_review/book_and_review_screen.dart';
import '../presentation/booking/book_and_review/booking_date/add_guest_room_screen.dart';
import '../presentation/booking/book_and_review/booking_date/booking_date_screen.dart';
import '../presentation/booking/book_and_review/contact_detail_screen.dart';
import '../presentation/booking/confirm/confirm_screen.dart';
import '../presentation/booking/payment/add_card_screen.dart';
import '../presentation/booking/payment/payment_booking_screen.dart';
import '../presentation/booking_flight/add_class_screen/add_class_screen.dart';
import '../presentation/booking_flight/booking_flight_screen.dart';
import '../presentation/booking_flight/check_out_flight/book_and_review_flight/book_and_review_flight_screen.dart';
import '../presentation/booking_flight/check_out_flight/confirm_flight/confirm_flight_screen.dart';
import '../presentation/booking_flight/check_out_flight/book_and_review_flight/add_contact_flight_screen.dart';
import '../presentation/booking_flight/check_out_flight/book_and_review_flight/add_passengers_screen.dart';
import '../presentation/booking_flight/check_out_flight/book_and_review_flight/add_promo_flight_screen.dart';
import '../presentation/booking_flight/check_out_flight/payment_flight/add_card_flight_screen.dart';
import '../presentation/booking_flight/check_out_flight/payment_flight/payment_flight_screen.dart';
import '../presentation/booking_flight/result_flight/result_flight_screen.dart';
import '../presentation/booking_flight/select_seat/select_seat_screen.dart';
import '../presentation/favourite/favourite_screen.dart';
import '../presentation/forgot_password/forgot_password_screen.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/hotel/detail_hotel/detail_hotel_screen.dart';
import '../presentation/hotel/hotel_screen.dart';
import '../presentation/hotel/review_hotel/review_hotel_screen.dart';
import '../presentation/hotel/review_hotel/write_review_hotel_screen.dart';
import '../presentation/hotel/select_room/select_room_screen.dart';
import '../presentation/login/login_screen.dart';
import '../presentation/onboarding/onboarding_screen.dart';
import '../presentation/payment/pages/modify_booking_room_screen.dart';
import '../presentation/payment/payment_screen.dart';
import '../presentation/signup/signup_screen.dart';
import '../presentation/splash/splash_screen.dart';
import '../presentation/user/user_screen.dart';
import '../widgets/scaffold_with_nav_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/$splashRoute',
    routes: [
      ShellRoute(
          builder: (context, state, child) {
            return SafeArea(child: child);
          },
          routes: [
            GoRoute(
              name: splashRoute,
              path: '/$splashRoute',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return _buildTransition(
                    state: state, screen: const SplashScreen());
              },
              routes: [
                GoRoute(
                  name: onboardingRoute,
                  path: onboardingRoute,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return _buildTransition(
                        state: state, screen: const OnboardingScreen());
                  },
                ),
                GoRoute(
                  name: loginRoute,
                  path: loginRoute,
                  //builder: (_, __) => const LoginScreen(),
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return _buildTransition(
                        state: state, screen: const LoginScreen());
                  },
                  routes: [
                    GoRoute(
                      name: signupRoute,
                      path: signupRoute,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _buildTransition(
                            state: state, screen: const SignUpScreen());
                      },
                    ),
                    GoRoute(
                      name: forgotRoute,
                      path: forgotRoute,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _buildTransition(
                            state: state, screen: const ForgotPasswordScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state,
                  StatefulNavigationShell navigationShell) {
                return ScaffoldWithNavBar(navigationShell: navigationShell);
              },
              branches: <StatefulShellBranch>[
                StatefulShellBranch(
                  navigatorKey: _shellNavigatorKey,
                  routes: <RouteBase>[
                    GoRoute(
                      name: homeRoute,
                      path: '/$homeRoute',
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _buildTransition(
                            state: state, screen: const HomeScreen());
                      },
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      name: favouriteRoute,
                      path: '/$favouriteRoute',
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _buildTransition(
                            state: state, screen: const FavouriteScreen());
                      },
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                        name: paymentRoute,
                        path: '/$paymentRoute',
                        pageBuilder:
                            (BuildContext context, GoRouterState state) {
                          return _buildTransition(
                              state: state, screen: const PaymentScreen());
                        },
                        // routes: [
                        //   GoRoute(
                        //     name: modifyBookingFlightRoute,
                        //     path: modifyBookingFlightRoute,
                        //     pageBuilder:
                        //         (BuildContext context, GoRouterState state) {
                        //       return _buildTransition(
                        //           state: state,
                        //           screen: const ModifyBookingFlightScreen());
                        //     },
                        //   ),
                        // ]
                        ),
                  ],
                ),
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      name: userRoute,
                      path: '/$userRoute',
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _buildTransition(
                            state: state, screen: const UserScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
                name: modifyBookingRoomRoute,
                path: '/$modifyBookingRoomRoute',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _buildTransition(
                      state: state, screen: const ModifyBookingRoomScreen());
                },
                routes: [
                  GoRoute(
                    name: hotleModifyRoute,
                    path: hotleModifyRoute,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return _buildTransition(
                          state: state, screen: const HotelScreen());
                    },
                  ),
                  GoRoute(
                    name: contactDetailModifyRoute,
                    path: contactDetailModifyRoute,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return _buildTransition(
                          state: state, screen: const ContactDetailScreen());
                    },
                  ),
                  GoRoute(
                      name: bookingDateModifyRoute,
                      path: bookingDateModifyRoute,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _buildTransition(
                            state: state, screen: const BookingDateScreen());
                      },
                      routes: [
                        GoRoute(
                          name: addGuestRoomModifyRoute,
                          path: addGuestRoomModifyRoute,
                          pageBuilder:
                              (BuildContext context, GoRouterState state) {
                            return _buildTransition(
                                state: state,
                                screen: const AddGuestRoomSreen());
                          },
                        ),
                      ]),
                ]),
            GoRoute(
                name: bookingFlightRoute,
                path: '/$bookingFlightRoute',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _buildTransition(
                      state: state, screen: const BookingFlightScreen());
                },
                routes: [
                  GoRoute(
                    name: addClassRoute,
                    path: addClassRoute,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return _buildTransition(
                          state: state, screen: const AddClassScreen());
                    },
                  ),
                  GoRoute(
                      name: resultFlightRoute,
                      path: resultFlightRoute,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _buildTransition(
                            state: state, screen: const ResultFlightScreen());
                      },
                      routes: [
                        GoRoute(
                            name: selectSeatRoute,
                            path: selectSeatRoute,
                            pageBuilder:
                                (BuildContext context, GoRouterState state) {
                              return _buildTransition(
                                  state: state,
                                  screen: const SelectSeatScreen());
                            },
                            routes: [
                              GoRoute(
                                  name: bookAndReviewFlightRoute,
                                  path: bookAndReviewFlightRoute,
                                  pageBuilder: (BuildContext context,
                                      GoRouterState state) {
                                    return _buildTransition(
                                        state: state,
                                        screen:
                                            const BookAndReviewFlightScreen());
                                  },
                                  routes: [
                                    GoRoute(
                                        name: paymentFlightRoute,
                                        path: paymentFlightRoute,
                                        pageBuilder: (BuildContext context,
                                            GoRouterState state) {
                                          return _buildTransition(
                                              state: state,
                                              screen:
                                                  const PaymentFlightScreen());
                                        },
                                        routes: [
                                          GoRoute(
                                            name: confirmFlightRoute,
                                            path: confirmFlightRoute,
                                            pageBuilder: (BuildContext context,
                                                GoRouterState state) {
                                              return _buildTransition(
                                                  state: state,
                                                  screen:
                                                      const ConfirmFlightScreen());
                                            },
                                          ),
                                          GoRoute(
                                            name: addCardFlightRoute,
                                            path: addCardFlightRoute,
                                            pageBuilder: (BuildContext context,
                                                GoRouterState state) {
                                              return _buildTransition(
                                                  state: state,
                                                  screen:
                                                      const AddCardFlightScreen());
                                            },
                                          ),
                                        ]),
                                    GoRoute(
                                      name: addPassengersRoute,
                                      path: addPassengersRoute,
                                      pageBuilder: (BuildContext context,
                                          GoRouterState state) {
                                        return _buildTransition(
                                            state: state,
                                            screen:
                                                const AddPassengersScreen());
                                      },
                                    ),
                                    GoRoute(
                                      name: addContactFlightRoute,
                                      path: addContactFlightRoute,
                                      pageBuilder: (BuildContext context,
                                          GoRouterState state) {
                                        return _buildTransition(
                                            state: state,
                                            screen:
                                                const AddContactFlightScreen());
                                      },
                                    ),
                                    GoRoute(
                                      name: addPromoFlightRoute,
                                      path: addPromoFlightRoute,
                                      pageBuilder: (BuildContext context,
                                          GoRouterState state) {
                                        return _buildTransition(
                                            state: state,
                                            screen:
                                                const AddPromoFlightScreen());
                                      },
                                    ),
                                  ]),
                            ]),
                      ]),
                ]),
            GoRoute(
                name: hotleRoute,
                path: '/$hotleRoute',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _buildTransition(
                      state: state, screen: const HotelScreen());
                },
                routes: [
                  GoRoute(
                      name: reviewHotelRoute,
                      path: reviewHotelRoute,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _buildTransition(
                            state: state, screen: const ReviewHotelScreen());
                      },
                      routes: [
                        GoRoute(
                          name: writeReviewHotelRoute,
                          path: writeReviewHotelRoute,
                          pageBuilder:
                              (BuildContext context, GoRouterState state) {
                            return _buildTransition(
                                state: state,
                                screen: const WriteReviewHotelScreen());
                          },
                        ),
                        GoRoute(
                          name: modifyReviewHotelRoute,
                          path: modifyReviewHotelRoute,
                          pageBuilder:
                              (BuildContext context, GoRouterState state) {
                            return _buildTransition(
                                state: state,
                                screen: const WriteReviewHotelScreen());
                          },
                        ),
                      ]),
                  GoRoute(
                    name: detailHotelRoute,
                    path: detailHotelRoute,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      final hotelEntity = state.extra! as HotelEntity;
                      return _buildTransition(
                          state: state,
                          screen: DetailHotelScreen(hotelEntity: hotelEntity));
                    },
                  ),
                  GoRoute(
                    name: selectRoomRoute,
                    path: selectRoomRoute,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return _buildTransition(
                          state: state, screen: const SelectRoomScreen());
                    },
                    routes: [
                      GoRoute(
                        name: bookAndReviewRoute,
                        path: bookAndReviewRoute,
                        pageBuilder:
                            (BuildContext context, GoRouterState state) {
                          return _buildTransition(
                              state: state,
                              screen: const BookAndReviewScreen());
                        },
                        routes: [
                          GoRoute(
                              name: bookingDateRoute,
                              path: bookingDateRoute,
                              pageBuilder:
                                  (BuildContext context, GoRouterState state) {
                                return _buildTransition(
                                    state: state,
                                    screen: const BookingDateScreen());
                              },
                              routes: [
                                GoRoute(
                                  name: addGuestRoute,
                                  path: addGuestRoute,
                                  pageBuilder: (BuildContext context,
                                      GoRouterState state) {
                                    return _buildTransition(
                                        state: state,
                                        screen: const AddGuestRoomSreen());
                                  },
                                ),
                              ]),
                          GoRoute(
                            name: contactDetailsRoute,
                            path: contactDetailsRoute,
                            pageBuilder:
                                (BuildContext context, GoRouterState state) {
                              return _buildTransition(
                                  state: state,
                                  screen: const ContactDetailScreen());
                            },
                          ),
                          GoRoute(
                            name: promoCodeRoute,
                            path: promoCodeRoute,
                            pageBuilder:
                                (BuildContext context, GoRouterState state) {
                              return _buildTransition(
                                  state: state,
                                  screen: const AddPromoFlightScreen());
                            },
                          ),
                          GoRoute(
                            name: paymentBookingRoute,
                            path: paymentBookingRoute,
                            pageBuilder:
                                (BuildContext context, GoRouterState state) {
                              return _buildTransition(
                                  state: state,
                                  screen: const PaymentBookingScreen());
                            },
                            routes: [
                              GoRoute(
                                name: addCardRoute,
                                path: addCardRoute,
                                pageBuilder: (BuildContext context,
                                    GoRouterState state) {
                                  return _buildTransition(
                                      state: state,
                                      screen: const AddCardScreen());
                                },
                              ),
                              GoRoute(
                                name: confirmRoute,
                                path: confirmRoute,
                                pageBuilder: (BuildContext context,
                                    GoRouterState state) {
                                  return _buildTransition(
                                      state: state,
                                      screen: const ComfirmScreen());
                                },
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
          ]),
    ]);

CustomTransitionPage<void> _buildTransition(
    {required GoRouterState state, required Widget screen}) {
  return CustomTransitionPage<void>(
    //key: state.pageKey,
    child: screen,
    barrierDismissible: true,
    barrierColor: Colors.black38,
    opaque: false,
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
