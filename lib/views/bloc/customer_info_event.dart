part of 'customer_info_bloc.dart';

abstract class CustomerInfoEvent extends Equatable {
  const CustomerInfoEvent();

  @override
  List<Object> get props => [];
}

class CustomerInfoInit extends CustomerInfoEvent {
  const CustomerInfoInit();

  @override
  String toString() => 'Pageinit';
}
