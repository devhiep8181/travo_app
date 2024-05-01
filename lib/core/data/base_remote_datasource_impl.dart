// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

// Project imports:
import '../../data/models/guest_flight_model.dart';
import '../utils/text_constant.dart';
import 'base_remote_datasource.dart';

class BaseRemoteDatasourceImpl implements BaseRemoteDatasource {
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStore = FirebaseFirestore.instance;

  @override
  Future<void> createUserWithEmail(
      {required String email,
      required String password,
      required String name,
      required String countryName,
      required String phoneNumber,
      required String image}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _createUserInCloudFireStore(
        name: name,
        phoneNumber: phoneNumber,
        countryName: countryName,
        email: email,
        image: image,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().e('The account already exists for that email.');
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<void> _createUserInCloudFireStore({
    required String name,
    required String countryName,
    required String phoneNumber,
    required String email,
    required String image,
  }) async {
    final firebaseUser = firebaseAuth.currentUser;
    Logger().i('user: $firebaseUser');

    await firebaseStore.collection('user').doc(email).set({
      'name': name,
      'country': countryName,
      'phoneNumber': phoneNumber,
      'email': email,
      'image': image,
    }, SetOptions(merge: false)).then((_) {
      Logger().i('CREATE USER SUCCESSFULLY');
    });
    //SetOptions(merge: fasle): nếu tài khoản trùng nhau tạo mới
  }

  @override
  Future<dynamic> signInUserWithEmail(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      print('error: $e');
    }
  }

  //nghịch generic
  @override
  Future<List<T>> getData<T>(
      {required String collectionName,
      required T Function(DocumentSnapshot<Object?> p1) fromFirestore}) async {
    final listData = <T>[];
    final getDataFireStore =
        await firebaseStore.collection(collectionName).get();
    final data = getDataFireStore.docs;
    for (final doc in data) {
      listData.add(fromFirestore(doc));
    }

    return listData;
  }

  @override
  Future<void> addBooking({
    required String creatAt,
    required String checkIn,
    required String checkOut,
    required String emailUser,
    required String emailGuest,
    required String nameGuest,
    required String phoneGuest,
    required String idHotel,
    required String nameRoom,
    required String numberCard,
    required String expDate,
    required String cvv,
    required String country,
    required String imagePath,
    required String typePayment,
    required String uid,
  }) async {
    await firebaseStore
        .collection(TextConstant.bookingCollection)
        .doc(uid)
        .set({
      'Create At': creatAt,
      'Check-in': checkIn,
      'Check-out': checkOut,
      'Email': emailUser,
      'Guest': {
        'email': emailGuest,
        'name': nameGuest,
        'phone': phoneGuest,
      },
      'Hotel': idHotel,
      'Room': nameRoom,
      'Card': {
        'number card': numberCard,
        'exp date': expDate,
        'cvv': cvv,
        'country': country
      },
      'Image': imagePath,
      'Type Payment': typePayment,
      'Uid Room Booking': uid,
    }).then((value) {
      Logger().i('Booking Success!!! id: $uid');
    });
  }

  @override
  Future<void> addBookingFlight({
    required String creatAt,
    required String emailUser,
    required int passengers,
    required double totalPrice,
    required String promoCode,
    required List<String> nameGuest,
    required String nameAirline,
    required List<String> seats,
    required List<String> classSeats,
    required String date,
    required String typePayment,
    required String numberCard,
    required String expDate,
    required String cvv,
    required String country,
    required String uid,
  }) async {
    final infoGuest = <GuestFlightModel>[];
    for (var i = 0; i < nameGuest.length; i++) {
      infoGuest.add(GuestFlightModel(
          name: nameGuest[i], seat: seats[i], classSeat: classSeats[i]));
    }
    await firebaseStore
        .collection(TextConstant.bookingFlightCollection)
        .doc(uid)
        .set({
      'Create At': creatAt,
      'Arrive': nameAirline,
      'Email': emailUser,
      'Passengers': passengers,
      'Total Price': totalPrice,
      'Promo Code': promoCode,
      'Date': date,
      'Guest': infoGuest.map((guest) => guest.toFirestore()).toList(),
      'Type Payment': typePayment,
      'Card': {
        'number card': numberCard,
        'exp date': expDate,
        'cvv': cvv,
        'country': country,
      },
      'Uid Booking Flight': uid,
    }).then((_) {
      Logger().i('Booking Flight Success!!! id: $uid');
    });
  }

  @override
  Future<dynamic> getUser({required String email}) async {
    final value = await firebaseStore
        .collection(TextConstant.userCollection)
        .doc(email)
        .get();

    return value.data();
  }

  @override
  Future<List<T>> getDataWithEmail<T>(
      {required String collectionName,
      required String email,
      required T Function(DocumentSnapshot<Object?> p1) fromFirestore}) async {
    final listData = <T>[];
    await firebaseStore
        .collection(collectionName)
        .where('Email', isEqualTo: email)
        .get()
        .then((value) {
      for (final result in value.docs) {
        listData.add(fromFirestore(result));
        //print('${result.data()}');
      }
    });

    return listData;
  }

  @override
  Future<void> updateBooking(
      {required String creatAt,
      required String checkIn,
      required String checkOut,
      required String emailGuest,
      required String nameGuest,
      required String idHotel,
      required String phoneGuest,
      required String nameRoom,
      required String imageRoom,
      required String uid}) async {
    await firebaseStore
        .collection(TextConstant.bookingCollection)
        .doc(uid)
        .update({
      'Create At': creatAt,
      'Check-in': checkIn,
      'Check-out': checkOut,
      'Guest': {
        'email': emailGuest,
        'name': nameGuest,
        'phone': phoneGuest,
      },
      'Hotel': idHotel,
      'Room': nameRoom,
      'Image': imageRoom,
    }).then((_) {
      print('update booking room success!');
    });
  }

  @override
  Future<void> updateBookingFlight({
    required String creatAt,
    required String emailUser,
    required int passengers,
    required double totalPrice,
    required String promoCode,
    required List<String> nameGuest,
    required String nameAirline,
    required List<String> seats,
    required List<String> classSeats,
    required String date,
    required String uid,
  }) async {
    final infoGuest = <GuestFlightModel>[];
    for (var i = 0; i < nameGuest.length; i++) {
      infoGuest.add(GuestFlightModel(
          name: nameGuest[i], seat: seats[i], classSeat: classSeats[i]));
    }

    await firebaseStore
        .collection(TextConstant.bookingFlightCollection)
        .doc(uid)
        .update({
      'Create At': creatAt,
      'Arrive': nameAirline,
      'Email': emailUser,
      'Passengers': passengers,
      'Total Price': totalPrice,
      'Promo Code': promoCode,
      'Date': date,
      'Guest': infoGuest.map((guest) => guest.toFirestore()).toList(),
    }).then((_) {
      print('update booking flight success with uid: $uid !!!');
    });
  }

  @override
  Future<void> deleteBooking(
      {required String uid, required String collectionName}) async {
    await firebaseStore.collection(collectionName).doc(uid).delete().then((_) {
      Logger().i('Delete booking with id: $uid');
    });
  }

  @override
  Future<void> addReviewHotel({
    required String? comment,
    required String? hotelId,
    required List<String>? photos,
    required String? ratedTime,
    required int? rating,
    required String? emailUser,
    required int? countlike,
    required int? countDislike,
    required String uid,
  }) async {
    await firebaseStore.collection(TextConstant.ratingCollection).doc(uid).set({
      'Email User': emailUser,
      'Comment': comment,
      'Rated Time': ratedTime,
      'Rating': rating,
      'Hotel Id': hotelId,
      'Like': countlike,
      'Dislike': countDislike,
      'Photos': photos,
      'Uid': uid,
    }).then((_) {
      Logger().i('$emailUser comment with id: $uid');
    });
  }

  @override
  Future<void> updateReviewHotel({
    required String? comment,
    required String? hotelId,
    required List<String>? photos,
    required String? ratedTime,
    required int? rating,
    required String? emailUser,
    required int? countlike,
    required int? countDislike,
    required String uid,
  }) async {
    await firebaseStore
        .collection(TextConstant.ratingCollection)
        .doc(uid)
        .update({
      'Email User': emailUser,
      'Comment': comment,
      'Rated Time': ratedTime,
      'Rating': rating,
      'Hotel Id': hotelId,
      'Like': countlike,
      'Dislike': countDislike,
      'Photos': photos,
      'Uid': uid,
    }).then((_) {
      Logger().i('update comment id: $uid');
    });
  }

  @override
  Future<void> updateReactReviewHotel(
      {required String uid,
      required int like,
      required int dislike,
     }) async {
    await firebaseStore
        .collection(TextConstant.ratingCollection)
        .doc(uid)
        .update({
      'Like': like,
      'Dislike': dislike,
    }).then((_) => Logger().i('Update react review id: $uid'));
  }

  @override
  Future<void> addReactReviewHotel(
      {required String email,
      required String uid,
      required bool? valueReact}) async {
    await firebaseStore
        .collection(TextConstant.ratingCollection)
        .doc(uid)
        .collection(TextConstant.reactSubCollection)
        .doc(email)
        .set({'Like or Disklike': valueReact}).then((_) {
      Logger().i('email: $email with value: $valueReact');
    });
  }

  @override
  Future<bool?> getValueReactReviewHotel(
      {required String email, required String uid}) async {
    final data = await firebaseStore
        .collection(TextConstant.ratingCollection)
        .doc(uid)
        .collection(TextConstant.reactSubCollection)
        .doc(email)
        .get();
   
    return data.data()?.values.first as bool?;
  }

  @override
  Future<void> updateValueReactReviewHotel(
      {required String email,
      required String uid,
      required bool? valueReact}) async {
    await firebaseStore
        .collection(TextConstant.ratingCollection)
        .doc(uid)
        .collection(TextConstant.reactSubCollection)
        .doc(email)
        .update({'Like or Disklike': valueReact}).then((_) {
      Logger().i('update email: $email with value: $valueReact');
    });
  }

  @override
  Future<void> deleteReact({required String email, required String uid}) async {
    await firebaseStore
        .collection(TextConstant.ratingCollection)
        .doc(uid)
        .collection(TextConstant.reactSubCollection)
        .doc(email)
        .delete()
        .then((_) {
      Logger().i('Delete react with email: $email');
    });
  }
}
