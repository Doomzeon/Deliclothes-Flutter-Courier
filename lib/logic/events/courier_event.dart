
import 'package:equatable/equatable.dart';

abstract class CourierEvent extends Equatable {
  const CourierEvent();
}
class CourierEventLogin extends CourierEvent {
  final String username, password;

  CourierEventLogin(this.username, this.password);
  @override
  // TODO: implement props
  List<Object> get props => [username, password];
}

class CourierEventSelectOrders extends CourierEvent {
  final int courierId;

  CourierEventSelectOrders(this.courierId);
  @override
  // TODO: implement props
  List<Object> get props => [courierId];
}

class CourierEventOrderArrived extends CourierEvent {
  final int orderId;
  final int courierId;

  CourierEventOrderArrived(this.orderId, this.courierId);
  @override
  // TODO: implement props
  List<Object> get props => [orderId];
}
class CourierEventAcceptOrder extends CourierEvent {
  final int courierId;
  final int orderId;

  CourierEventAcceptOrder(this.orderId, this.courierId);
  @override
  // TODO: implement props
  List<Object> get props => [orderId, courierId];
}