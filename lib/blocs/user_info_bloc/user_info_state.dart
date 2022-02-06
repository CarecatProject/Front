part of 'user_info_bloc.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

class UserInfoLoading extends UserInfoState {
  @override
  String toString() => 'PageLoading';
}

class UserInfoLoaded extends UserInfoState {
  final Position userPosition;

  const UserInfoLoaded({required this.userPosition});

  @override
  String toString() => 'FirstPageLoaded with ';

  @override
  List<Object> get props => [userPosition];

  UserInfoLoaded copyWith({Position? userPosition}) {
    return UserInfoLoaded(userPosition: userPosition ?? this.userPosition);
  }
}
