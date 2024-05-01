part of 'react_bloc.dart';

abstract class ReactEvent extends Equatable {
  const ReactEvent();

  @override
  List<Object> get props => [];
}

class GetValueReactEvent extends ReactEvent {
  const GetValueReactEvent({
    required this.uid,
    required this.email,
  });
  final String uid;
  final String email;

  @override
  List<Object> get props => [uid, email];
}

class UpdateValueReactEvent extends ReactEvent {
  const UpdateValueReactEvent({
    required this.uid,
    required this.email,
    this.valueReact,
  });
  final String uid;
  final String email;
  final bool? valueReact;

  @override
  List<Object> get props => [uid, email];
}

//Xoá khi người chủ đăng bài xoá bài
class DeleteValueReactEvent extends ReactEvent {
  const DeleteValueReactEvent({
    required this.uid,
    required this.email,
  });
  final String uid;
  final String email;

  @override
  List<Object> get props => [uid, email];
}

class PushValueReactEvent extends ReactEvent {
  const PushValueReactEvent({
    required this.uid,
    required this.email,
    this.valueReact,
  });
  final String uid;
  final String email;
  final bool? valueReact;

  @override
  List<Object> get props => [uid, email];
}
