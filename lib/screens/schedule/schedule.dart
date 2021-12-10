import 'package:courier_app/logic/bloc/courier_bloc.dart';
import 'package:courier_app/logic/events/courier_event.dart';
import 'package:courier_app/logic/states/courier_states.dart';
import 'package:courier_app/main.dart';
import 'package:courier_app/screens/schedule/widgets/row_order_info.dart';
import 'package:courier_app/widgets/bottom_modal_take_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    var _stateUser = context.select((CourierBlocLogin cb) => cb.state);

  Future<void> refreshOrders() async{

    await BlocProvider.of<CourierBlocOrders>(context).add(
            CourierEventSelectOrders(_stateUser is CourierLoginSuccess
                ? _stateUser.courierId
                : null));
  }
    return RefreshIndicator(
      onRefresh: refreshOrders,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(children: [
          BlocBuilder<CourierBlocLogin, CourierState>(
            builder: (context, state) {
              if (state is CourierLoginSuccess) {
                return OrderRowInfo(courierId: state.courierId);
              } else {
                return Container();
              }
            },
          ),
        ]),
      ),
    );
  }
}
