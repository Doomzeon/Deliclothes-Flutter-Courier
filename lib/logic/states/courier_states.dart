
import 'package:courier_app/models/order_info.dart';
import 'package:equatable/equatable.dart';

abstract class CourierState extends Equatable {
  const CourierState();

  @override
  List<Object> get props => [];
}

class CourierInitialState extends CourierState {}

class CourierLoginInProgress extends CourierState {}

class CourierNotLoggedIn extends CourierState {}

class CourierLoginSuccess extends CourierState {
  final int courierId;
  CourierLoginSuccess(this.courierId);

  @override
  List<Object> get props => [courierId];
}
class CourierSelectOrdersInitialState extends CourierState {}

class CourierSelectOrdersInProgress extends CourierState {}

class CourierSelectOrdersNotLoggedIn extends CourierState {}

class CourierSelectOrdersSuccess extends CourierState {
  final List<OrderInfo> orders;
  CourierSelectOrdersSuccess(this.orders);

  @override
  List<Object> get props => [orders];
}

class OrderStatusInitalState extends CourierState {}

class OrderStatusLoadedSuccess extends CourierState {}

class OrderStatusLoadInProgress extends CourierState {}

class NewOrderWaitingAccept extends CourierState {}

class NewOrderAccepted extends CourierState {}

 