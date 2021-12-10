
import 'package:courier_app/models/directions.dart';
import 'package:equatable/equatable.dart';

class OrderInfo extends Equatable {
  final String  startTime, endTime, date, month, streetDelivery, city,day;
  final int cap, orderId, quantityTot, phoneUser;
  final List<Directions> directions;

  OrderInfo(this.orderId, this.startTime, this.endTime, this.date, this.month, this.streetDelivery, this.city, this.cap, this.directions, this.quantityTot, this.day, this.phoneUser);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();


  static OrderInfo fromJson(dynamic data) {
    return OrderInfo(
        data['order_id'] as int,
        data['start_time'] as String,
        data['end_time'] as String,
        data['date'] as String,
        data['month'] as String,
        data['street_delivery'] as String,
        data['city'] as String,
        data['cap'] as int,
        List<Directions>.from(data['directions'].map((d)=> Directions.fromJson(d))),
        data['quantity'] as int,
        data['day'] as String,
        data['user_phone'] as int
        );
  }
}
