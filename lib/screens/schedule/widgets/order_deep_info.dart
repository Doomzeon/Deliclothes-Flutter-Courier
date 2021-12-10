import 'package:courier_app/constant.dart';
import 'package:courier_app/logic/bloc/courier_bloc.dart';
import 'package:courier_app/logic/events/courier_event.dart';
import 'package:courier_app/logic/states/courier_states.dart';
import 'package:courier_app/models/directions.dart';
import 'package:courier_app/screens/schedule/widgets/estimated_times_of_delivery_with_desciprtion_container.dart';
import 'package:courier_app/screens/schedule/widgets/row_order_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class OrderDeepInfo extends StatefulWidget {
  final List<Directions> directions;
  final int phoneUser;
  final String timeStart, timeEnd;
  final int totQuantityCothes;
  final int orderId;
  final int courierId;
  const OrderDeepInfo(
      {Key key,
      this.directions,
      this.timeStart,
      this.timeEnd,
      this.totQuantityCothes,
      this.orderId, this.courierId, this.phoneUser})
      : super(key: key);
  @override
  _OrderDeepInfoState createState() => _OrderDeepInfoState();
}

class _OrderDeepInfoState extends State<OrderDeepInfo> {
  @override
  Widget build(BuildContext context) {

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Chiudi"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Ordine"),
    content: Text("Congratualzione hai completato la consegna"),
    actions: [
      cancelButton
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: BlocConsumer<CourierBlocLogin, CourierState>(
            listener: (context, state) {
          // TODO: implement listener
        }, builder: (context, state) {
          if (state is OrderStatusLoadInProgress) {
            return SpinnerContainer(size);
          } else if (state is OrderStatusLoadedSuccess) {
            return Column(
              children: [
                Container(child: Text('Torna in dietro.'),),
              ],
            );
          } else {
            return Column(
              children: [
                HeaderContainer(size: size),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 25, left: 20),
                      child: Text(
                          'Consegna da ' +
                              widget.timeStart +
                              ' a ' +
                              widget.timeEnd,
                          style: TextStyle(
                              color: Color(0xff0E0E16),
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0,
                              fontFamily: 'AvenirRegular')),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 25, left: 20),
                      child: Text(
                          'Totale vestiti da prendere ' +
                              widget.totQuantityCothes.toString(),
                          style: TextStyle(
                              color: Color(0xff505165),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              fontFamily: 'AvenirRegular')),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 25, left: 20),
                      child: Text(
                          'Telefono di proprietario ' +
                              widget.phoneUser.toString(),
                          style: TextStyle(
                              color: Color(0xff505165),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              fontFamily: 'AvenirRegular')),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25, left: 20),
                      child: Icon(Icons.phone_callback_outlined, color: Color(0xff505165)),
                    )
                  ],
                ),
                EstimatedTimesOfDeliveryWithDesciprtionContainer(
                  directions: widget.directions,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => {
                        BlocProvider.of<CourierBlocOrders>(context)
                            .add(CourierEventOrderArrived(widget.orderId, widget.courierId)),
                            showAlertDialog(context)
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 15),
                          width: size.width,
                          height: 70,
                          child: Stack(children: [
                            Positioned(
                              top: 5,
                              left: size.width * 0.29,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius:
                                        BorderRadius.circular(40)),
                                width: 180,
                                height: 45,
                                child: Center(
                                  child: Text('Consegna eseguita',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0,
                                          fontFamily: 'AvenirRegular')),
                                ),
                              ),
                            ),
                          ])),
                    )
                  ],
                ),
              ],
            );
          }
        }));
  }
}

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.width,
          height: 80,
          padding: EdgeInsets.only(top: 50),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined,
                    color: Color(0xff0E0E16)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                margin: EdgeInsets.only(left: 5, top: 5),
                child: Center(
                  child: Text("Idietro",
                      style: TextStyle(
                          color: Color(0xff0E0E16),
                          fontWeight: FontWeight.bold,
                          fontSize: 19.0,
                          fontFamily: 'AvenirRegular')),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
