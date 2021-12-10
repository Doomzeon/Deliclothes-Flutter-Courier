
import 'package:courier_app/logic/events/courier_event.dart';
import 'package:courier_app/logic/local_storage.dart';
import 'package:courier_app/logic/server/api.dart';
import 'package:courier_app/logic/states/courier_states.dart';
import 'package:courier_app/main.dart';
import 'package:courier_app/models/order_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourierBlocLogin extends Bloc<CourierEvent, CourierState> {
  CourierBlocLogin(CourierState initialState) : super(initialState);

  @override
  Stream<CourierState> mapEventToState(event) async* {
    // TODO: implement mapEventToState
    if (event is CourierEventLogin) {
      yield CourierLoginInProgress();
      try {
        int _idCourier = await Api().courierLogin(event.password, event.username);
        LocalStorageSecure.setUser(_idCourier);
        yield CourierLoginSuccess(_idCourier);
        onPressedNavItem(1);
      } catch (e) {
        print('An errore ocurring while executing sign in of user=>' +
            e.toString());
        
      }
    } 
}
}


class CourierBlocOrders extends Bloc<CourierEvent, CourierState> {
  CourierBlocOrders(CourierState initialState) : super(initialState);

  @override
  Stream<CourierState> mapEventToState(event) async* {
    if(event is CourierEventSelectOrders){
      yield CourierSelectOrdersInProgress();
      try {
        List<OrderInfo> _orders = await Api().selectOrders(event.courierId);
        yield CourierSelectOrdersSuccess(_orders);
        onPressedNavItem(1);
      } catch (e) {
        print('An errore ocurring while executing sign in of user=>' +
            e.toString());
        
      }
    }else if(event is CourierEventOrderArrived){
      try {
        yield OrderStatusLoadInProgress();
        String _orders = await Api().orderDelivered(event.orderId, event.courierId);
        yield OrderStatusLoadedSuccess();
        //onPressedNavItem(1);
      } catch (e) {
        print('An errore ocurring while executing sign in of user=>' +
            e.toString());
        
      }
    } else if(event is CourierEventAcceptOrder){
      try {
        String _orders = await Api().acceptOrder(event.orderId, event.courierId);
        yield NewOrderAccepted();
        //onPressedNavItem(1);
      } catch (e) {
        print('An errore ocurring while executing sign in of user=>' +
            e.toString());
        
      }
    }
  }

}