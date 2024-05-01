part of 'add_passenger_bloc.dart';

enum AddPassengerStatus { initial, loading, loaded, success, error }

extension AddPassengerStatusX on AddPassengerStatus {
  bool get isLoaded => [AddPassengerStatus.loaded].contains(this);
  bool get isSucees => [AddPassengerStatus.success].contains(this);
}

class AddPassengerState extends Equatable {
  const AddPassengerState(
      {required this.addPassengerStatus,
      required this.mapValueIndentity,
      required this.mapValueName,
      required this.mapEmail,
      });
  final Map<int, String> mapValueIndentity;
  final Map<String, String>
      mapValueName; //cái này có thể phát triển để lưu thêm email;
  final AddPassengerStatus addPassengerStatus;
  final Map<String, String> mapEmail;

  @override
  List<Object> get props =>
      [addPassengerStatus, mapValueIndentity, mapValueName];

  AddPassengerState copyWith({
    Map<int, String>? mapValueIndentity,
    Map<String, String>? mapValueName,
    AddPassengerStatus? addPassengerStatus,
    Map<String, String>? mapEmail,
  }) {
    return AddPassengerState(
      mapValueIndentity: mapValueIndentity ?? this.mapValueIndentity,
      mapValueName: mapValueName ?? this.mapValueName,
      addPassengerStatus: addPassengerStatus ?? this.addPassengerStatus,
      mapEmail: mapEmail ?? this.mapEmail,
    );
  }
}
