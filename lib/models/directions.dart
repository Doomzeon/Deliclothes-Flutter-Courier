
import 'package:equatable/equatable.dart';

class Directions extends Equatable {
  final String shopName, street, city, estimatedTimeArrives;
  final int quantity, cap;

  Directions(this.shopName, this.street, this.city, this.cap, this.estimatedTimeArrives, this.quantity);
  

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();


  static Directions fromJson(dynamic data) {
    return Directions(
        data['shop_name'] as String,
        data['street'] as String,
        data['city'] as String,
        data['cap'] as int,
        data['estimatedTimeArrives'] as String,
        data['quantity'] as int
        );
  }
}
