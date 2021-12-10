import 'package:courier_app/constant.dart';
import 'package:courier_app/logic/bloc/courier_bloc.dart';
import 'package:courier_app/logic/events/courier_event.dart';
import 'package:courier_app/main.dart';
import 'package:courier_app/screens/sign_in/widgets/procced_button_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future buildShowModalBottomSheet(BuildContext context, idOrder, idCourier) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Center(
                    child: Text('Nuovo ordine in arrivo',
                        style: TextStyle(
                            color: Color(0xff0E0E16),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'AvenirRegular')),
                  )),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 15),
                    child: Text("Info sull'ordine:",
                        style: TextStyle(
                            color: Color(0xff0E0E16),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'AvenirLight')),
                  ),
                ],
              ),
              ListTile(
                leading:
                    new Icon(Icons.av_timer_outlined, color: Color(0xff0E0E16)),
                title: new Text('Partenza ora 14:40',
                    style: TextStyle(
                        color: Color(0xff505165),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        fontFamily: 'AvenirLight')),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:
                    new Icon(Icons.av_timer_outlined, color: Color(0xff0E0E16)),
                title: new Text('Arrivo stimatto 14:60',
                    style: TextStyle(
                        color: Color(0xff505165),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        fontFamily: 'AvenirLight')),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.shopping_bag_outlined,
                    color: Color(0xff0E0E16)),
                title: new Text('10 vestiti da consegnare',
                    style: TextStyle(
                        color: Color(0xff505165),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        fontFamily: 'AvenirLight')),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProccedButtonSignContainer(
                    colorButton: kSecondaryColor,
                    textButton: "Acceta l'ordine",
                    callbackFunction: () => {
                      print(idCourier),
                      print(idOrder),
                      socket.emit('accept_order', {'id_order':idOrder, 'id_courier':idCourier}),
                      Navigator.pop(context)
                      /*BlocProvider.of<CourierBloc>(context)
                          .add(CourierEventAcceptOrder(idOrder, idCourier))*/
                    },
                  )
                ],
              ),
            ],
          ),
        );
      });
}
