import 'package:courier_app/models/order_info.dart';
import 'package:courier_app/screens/schedule/widgets/container_date_time_info_orders_delivery.dart';
import 'package:courier_app/screens/schedule/widgets/row_order_info.dart';
import 'package:flutter/material.dart';

class MonthOrdersContainer extends StatefulWidget {
  final List<OrderInfo> orders;
  final int courierId;
  const MonthOrdersContainer({
    Key key,
    this.orders, this.courierId,
  }) : super(key: key);

  @override
  _MonthOrdersContainerState createState() => _MonthOrdersContainerState();
}

class _MonthOrdersContainerState extends State<MonthOrdersContainer> {
  @override
  Widget build(BuildContext context) {
    print(widget.orders);
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(children: [
        ...widget.orders.map((e) => Container(
              child: Column(
                children: [
                  MonthDeliveryRow(size: size, month: e.month),
                  ...widget.orders
                      .map((d) => 

                      e.month==d.month?ContainerDateTimeInfoOrdersDelivery(
                        phoneUser: d.phoneUser,
                            size: size,
                            day: d.day,
                            orderId: d.orderId,
                            timeStart: d.startTime,
                            timeEnd: d.endTime,
                            check: d.quantityTot,
                            directions:d.directions,
                            courierId: widget.courierId,
                          ):null),

                ],
              ),
            ))
      ]

          ),
    );
  }
}

class MonthDeliveryRow extends StatelessWidget {
  const MonthDeliveryRow({
    Key key,
    @required this.size,
    this.month,
  }) : super(key: key);

  final Size size;
  final String month;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.only(
                top: size.width * 0.05, left: size.width * 0.04),
            child: Text(month,
                style: TextStyle(
                    color: Color(0xff505165),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    fontFamily: 'AvenirLight')))
      ],
    );
  }
}
