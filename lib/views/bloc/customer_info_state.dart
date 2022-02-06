part of 'customer_info_bloc.dart';

abstract class CustomerInfoState extends Equatable {
  const CustomerInfoState();

  @override
  List<Object> get props => [];
}

class CustomerInfoLoading extends CustomerInfoState {
  @override
  String toString() => 'PageLoading';
}

class CustomerInfoLoaded extends CustomerInfoState {
  final Position userPosition;

  const CustomerInfoLoaded({required this.userPosition});

  @override
  String toString() => 'FirstPageLoaded with ';

  @override
  List<Object> get props => [userPosition];

  CustomerInfoLoaded copyWith({Position? userPosition}) {
    return CustomerInfoLoaded(userPosition: userPosition ?? this.userPosition);
  }
}
