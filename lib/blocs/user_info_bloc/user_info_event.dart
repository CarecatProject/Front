part of 'user_info_bloc.dart';

abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();

  @override
  List<Object> get props => [];
}

class UserInfoInit extends UserInfoEvent {
  const UserInfoInit();

  @override
  String toString() => 'Pageinit';
}
