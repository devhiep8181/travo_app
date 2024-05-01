// Flutter imports:

// Flutter imports:

import 'package:flutter/material.dart';

// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:

import '../../core/data/base_remote_datasource_impl.dart';
import '../../core/network/network_info.dart';

import '../../data/datasources/auth/auth_remote_datasource_impl.dart';

import '../../data/datasources/auth/get_user_remote_datasource_impl.dart';
import '../../data/datasources/booking_flight/get_booking_flight_remote_datasource_impl.dart';
import '../../data/datasources/booking_room/booking_room_remote_datasource_impl.dart';
import '../../data/datasources/flight/booking_flight_datasource_impl.dart';
import '../../data/datasources/flight/flight_remote_datasoure_impl.dart';
import '../../data/datasources/hotel/hotel_remote_datasource_impl.dart';

import '../../data/datasources/place/place_remote_datasource_impl.dart';
import '../../data/datasources/promo/promo_remote_datasource_impl.dart';
import '../../data/datasources/rating/action_reat_remote_datasource_impl.dart';
import '../../data/datasources/rating/rating_remote_datasource_impl.dart';
import '../../data/datasources/rating/react_remote_datasource_impl.dart';
import '../../data/datasources/room/room_remote_datasource_impl.dart';

import '../../data/datasources/sign_up/create_user_remote_impl.dart';
import '../../data/repositories/auth_repository/auth_repository_impl.dart';
import '../../data/repositories/auth_repository/get_user_repository_impl.dart';
import '../../data/repositories/booking_flight_repository/get_booking_flight_repository_impl.dart';
import '../../data/repositories/booking_room_repository/booking_room_repository_impl.dart';
import '../../data/repositories/flight_repository/booking_flight_repository_impl.dart';
import '../../data/repositories/flight_repository/flight_repository_impl.dart';
import '../../data/repositories/hotel_repository/hotel_repository_impl.dart';
import '../../data/repositories/place_repository/place_repository_impl.dart';
import '../../data/repositories/promo_repository/promo_repository_impl.dart';
import '../../data/repositories/rating_repository/action_react_repository_impl.dart';
import '../../data/repositories/rating_repository/rating_repository_impl.dart';
import '../../data/repositories/rating_repository/react_repository_impl.dart';
import '../../data/repositories/room_repository/room_repository_impl.dart';

import '../../data/repositories/sign_up_repository/create_user_repository_impl.dart';
import '../../domain/usecases/action_react/delete_value_react_usecase.dart';
import '../../domain/usecases/action_react/get_value_react_usecase.dart';
import '../../domain/usecases/action_react/push_value_react_usecase.dart';
import '../../domain/usecases/action_react/update_value_react_usecase.dart';
import '../../domain/usecases/auth/get_user_usecase.dart';
import '../../domain/usecases/auth/verify_user_usecase.dart';
import '../../domain/usecases/booking_flight/get_booking_flight_usecase.dart';
import '../../domain/usecases/booking_room/delete_booking_room_usecase.dart';
import '../../domain/usecases/booking_room/get_booking_room_usecase.dart';
import '../../domain/usecases/booking_room/update_booking_room_usecase.dart';
import '../../domain/usecases/flight/booking_flight_usecase.dart';
import '../../domain/usecases/flight/delete_booking_flight_usecase.dart';
import '../../domain/usecases/flight/get_flight_usecase.dart';
import '../../domain/usecases/flight/update_booking_flight_usecase.dart';
import '../../domain/usecases/hotel/get_hotel_usecase.dart';
import '../../domain/usecases/place/get_place_usecase.dart';
import '../../domain/usecases/promo/get_promo_usecase.dart';
import '../../domain/usecases/rating/delete_review_usecase.dart';
import '../../domain/usecases/rating/get_review_usecase.dart';
import '../../domain/usecases/rating/push_review_usecase.dart';
import '../../domain/usecases/rating/update_react_usecase.dart';
import '../../domain/usecases/rating/update_review_usecase.dart';
import '../../domain/usecases/room/get_room_usecase.dart';
import '../../domain/usecases/sign_up/creat_user_usecase.dart';

///dependency injection repositories vào context.
MultiRepositoryProvider repositoryProviders({required Widget child}) =>
    MultiRepositoryProvider(
      providers: [
        //!Auth
        RepositoryProvider(
            create: (context) => VerifyUserUseCase(
                authRepository: AuthRepositoryImpl(
                    authRemoteDatasource: AuthRemoteDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl()),
                    networkInfo: NetworkInfoImpl(Connectivity())))),

        //!Place
        RepositoryProvider<GetPlaceUseCase>(
            create: (context) => GetPlaceUseCase(
                placeRepository: PlaceRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    placeRemoteDataSource: PlaceRemoteDataSourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        //! Hotel
        RepositoryProvider<GetHotelUsecase>(
            create: (context) => GetHotelUsecase(
                hotelRepository: HotelRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    hotelRemoteDataSource: HotelRemoteDataSourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        //! Room
        RepositoryProvider<GetRoomUseCase>(
            create: (context) => GetRoomUseCase(
                roomRepository: RoomRepositoryImpl(
                    roomRemoteDataSource: RoomRemoteDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl()),
                    networkInfo: NetworkInfoImpl(Connectivity())))),

        //!Promo
        RepositoryProvider<GetPromoUseCase>(
            create: (context) => GetPromoUseCase(
                promoRepository: PromoRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    promoRemoteDatasoure: PromoRemoteDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        //!Flight
        RepositoryProvider<GetFlightUseCase>(
            create: (context) => GetFlightUseCase(
                flightRepository: FlightRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    flightRemoteDatasource: FlightRemoteDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        RepositoryProvider<UpdateBookingFlightUseCase>(
            create: (context) => UpdateBookingFlightUseCase(
                flightRepository: FlightRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    flightRemoteDatasource: FlightRemoteDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        RepositoryProvider<DeleteBookingFlightUseCase>(
            create: (context) => DeleteBookingFlightUseCase(
                flightRepository: FlightRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    flightRemoteDatasource: FlightRemoteDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        //Booking Flight
        RepositoryProvider<BookingFlightUseCase>(
            create: (context) => BookingFlightUseCase(
                bookingFlightRepository: BookingFlightRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    bookingFlightDatasource: BookingFlightDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        //User
        RepositoryProvider<GetUserUseCase>(
            create: (context) => GetUserUseCase(
                getUserRepository: GetUserRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    getUserRemoteDatasource: GetUserRemoteDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        //Room Booking with Email
        RepositoryProvider<GetBookingRoomUsecase>(
            create: (context) => GetBookingRoomUsecase(
                bookingRoomRepository: BookingRoomRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    bookingRoomRemoteDataSource:
                        BookingRoomRemoteDataSourceImpl(
                            baseRemoteDatasource:
                                BaseRemoteDatasourceImpl())))),

        RepositoryProvider<UpdateBookingRoomUseCase>(
            create: (context) => UpdateBookingRoomUseCase(
                bookingRoomRepository: BookingRoomRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    bookingRoomRemoteDataSource:
                        BookingRoomRemoteDataSourceImpl(
                            baseRemoteDatasource:
                                BaseRemoteDatasourceImpl())))),

        RepositoryProvider<DeleteBookingRoomUseCase>(
            create: (context) => DeleteBookingRoomUseCase(
                bookingRoomRepository: BookingRoomRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    bookingRoomRemoteDataSource:
                        BookingRoomRemoteDataSourceImpl(
                            baseRemoteDatasource:
                                BaseRemoteDatasourceImpl())))),

        //Create User
        RepositoryProvider<CreateUserUsecase>(
            create: (context) => CreateUserUsecase(
                createUserRepository: CreateUserRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    createUserRemote: CreateUserRemoteImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),
        //Get booking flight
        RepositoryProvider<GetBookingFlightUseCase>(
            create: (context) => GetBookingFlightUseCase(
                getBookingFlightRepository: GetBookingFlightRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    getBookingFlightRemoteDatasource:
                        GetBookingFlightRemoteDatasourceImpl(
                            baseRemoteDatasource:
                                BaseRemoteDatasourceImpl())))),

        //Review hotel

        RepositoryProvider<GetReviewUseCase>(
            create: (context) => GetReviewUseCase(
                ratingRepository: RatingRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    ratingRemoteDatasource: RatingRemoteDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        RepositoryProvider<UpdateReviewUseCase>(
            create: (context) => UpdateReviewUseCase(
                ratingRepository: RatingRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    ratingRemoteDatasource: RatingRemoteDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        RepositoryProvider<PushReviewUseCase>(
            create: (context) => PushReviewUseCase(
                ratingRepository: RatingRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    ratingRemoteDatasource: RatingRemoteDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        RepositoryProvider<DeleteReviewUseCase>(
            create: (context) => DeleteReviewUseCase(
                ratingRepository: RatingRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    ratingRemoteDatasource: RatingRemoteDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        RepositoryProvider<UpdateReactUseCase>(
            create: (context) => UpdateReactUseCase(
                reactRepository: ReactRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    reactRemoteDatasource: ReactRemoteDatasourceImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        //React Review Hotel
        RepositoryProvider<GetValueReactUseCase>(
            create: (context) => GetValueReactUseCase(
                actionReactRepository: ActionReactRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    actionReactRemoteDataSoure: ActionReactRemoteDatasoureImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

         RepositoryProvider<PushValueReactUseCase>(
            create: (context) => PushValueReactUseCase(
                actionReactRepository: ActionReactRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    actionReactRemoteDataSoure: ActionReactRemoteDatasoureImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

        
         RepositoryProvider<DeleteValueReactUseCase>(
            create: (context) => DeleteValueReactUseCase(
                actionReactRepository: ActionReactRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    actionReactRemoteDataSoure: ActionReactRemoteDatasoureImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),

                  
         RepositoryProvider<UpdateValueReactUseCase>(
            create: (context) => UpdateValueReactUseCase(
                actionReactRepository: ActionReactRepositoryImpl(
                    networkInfo: NetworkInfoImpl(Connectivity()),
                    actionReactRemoteDataSoure: ActionReactRemoteDatasoureImpl(
                        baseRemoteDatasource: BaseRemoteDatasourceImpl())))),    
      ],
      child: child,
    );
