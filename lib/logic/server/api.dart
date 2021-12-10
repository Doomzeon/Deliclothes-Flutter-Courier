
import 'dart:convert';
import 'package:courier_app/main.dart';
import 'package:courier_app/models/order_info.dart';
import 'package:http/http.dart' as http;

class Api {
  final String baseUrl = 'http://localhost:8080';

  Future<int> courierLogin(String password, String email) async {
    print(password);
    print('Executing loggin of the user');
    final result = await http.Client().post(baseUrl + '/api_v1/courier/login',
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'payload': {'password': password, 'email': email}
        }));
    if (result.statusCode != 200) throw (Exception());
    int _idCourier = json.decode(result.body)['payload']['id'];
    print('User logged in with id: ' + _idCourier.toString());
    socket.emit('queque', {'id_courier':_idCourier,"orders":[]});
    return _idCourier;
  }

  Future<List<OrderInfo>> selectOrders(int courierId) async {
    print('Selecting orders');
    final result = await http.Client().get(baseUrl + '/api_v1/select_orders/'+courierId.toString(),
        headers: {"Content-Type": "application/json"});
    if (result.statusCode != 200) throw (Exception());
    var JSONDecoded = json.decode(result.body);
    List<OrderInfo> orders = List<OrderInfo>.from(
        JSONDecoded['payload'].map((data) => OrderInfo.fromJson(data)));
    return orders;
  }

  Future<String> orderDelivered(int orderId, int courierId) async {
    final result = await http.Client().put(baseUrl + '/api_v1/'+courierId.toString()+'/delivery_done/'+orderId.toString(),
        headers: {"Content-Type": "application/json"});
    if (result.statusCode != 200) throw (Exception());
    
    return 'ok';
  }

  Future<String> acceptOrder(int orderId, int idCourier) async {
    final result = await http.Client().post(baseUrl + '/api_v1/'+idCourier.toString()+'/accept_order/'+orderId.toString(),
        headers: {"Content-Type": "application/json"});
    if (result.statusCode != 200) throw (Exception());
    
    return 'ok';
  }

  

  
}