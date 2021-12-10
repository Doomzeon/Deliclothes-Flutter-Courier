import 'package:courier_app/constant.dart';
import 'package:courier_app/logic/bloc/courier_bloc.dart';
import 'package:courier_app/logic/events/courier_event.dart';
import 'package:courier_app/logic/states/courier_states.dart';
import 'package:courier_app/main.dart';
import 'package:courier_app/screens/schedule/widgets/container_date_time_info_orders_delivery.dart';
import 'package:courier_app/screens/schedule/widgets/month_orders_container.dart';
import 'package:courier_app/widgets/bottom_modal_take_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OrderRowInfo extends StatefulWidget {
  final int courierId;
  const OrderRowInfo({
    Key key,
    this.courierId,
  }) : super(key: key);

  @override
  _OrderRowInfoState createState() => _OrderRowInfoState();
}

class _OrderRowInfoState extends State<OrderRowInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    socket.on(
        'new_order',
        (data) => {
              print('received data from socket:'),
              print(data),
              buildShowModalBottomSheet(context, data['order_id'], 0)
                  .then((value) => setState(() => {
                        BlocProvider.of<CourierBlocOrders>(context)
                            .add(CourierEventSelectOrders(widget.courierId)),
                        // _onPageChanged(1),
                      }))
            });
    return Container(
        width: size.width,
        padding: EdgeInsets.only(top: 70),
        child: Column(
          children: [
            BlocBuilder<CourierBlocOrders, CourierState>(
              builder: (context, state) {
                return BlocConsumer<CourierBlocOrders, CourierState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is CourierSelectOrdersSuccess) {
                      return RefreshIndicator(
                        onRefresh: () {
                          print('Refreshing page!');
                        },
                        child: MonthOrdersContainer(
                          orders: state.orders,
                          courierId: widget.courierId,
                        ),
                      );
                    } else if (state is CourierSelectOrdersInProgress) {
                      return SpinnerContainer(size);
                    } else if (state is CourierSelectOrdersInitialState) {
                      BlocProvider.of<CourierBlocOrders>(context)
                          .add(CourierEventSelectOrders(widget.courierId));
                      return Container();
                    } else {
                      return Container();
                    }
                  },
                );
              },
            ),
          ],
        ));
  }
}

Container SpinnerContainer(Size size) {
  return Container(
    width: size.width,
    height: 310,
    child: SpinKitWanderingCubes(color: kBackgroundHeaderColor, size: 50.0),
  );
}
