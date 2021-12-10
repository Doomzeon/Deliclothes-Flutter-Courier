import 'package:courier_app/models/directions.dart';
import 'package:courier_app/screens/schedule/widgets/order_deep_info.dart';
import 'package:courier_app/widgets/bottom_modal_take_order.dart';
import 'package:flutter/material.dart';

class ContainerDateTimeInfoOrdersDelivery extends StatefulWidget {
  final String day, timeStart, timeEnd;
  final int check;
  final int phoneUser;
  final int orderId;
  final List<Directions> directions;
  final int courierId;
  const ContainerDateTimeInfoOrdersDelivery({
    Key key,
    @required this.size,
    this.day,
    this.timeStart,
    this.timeEnd,
    this.check,
    this.orderId, this.directions, this.courierId, this.phoneUser,
  }) : super(key: key);

  final Size size;

  @override
  _ContainerDateTimeInfoOrdersDeliveryState createState() =>
      _ContainerDateTimeInfoOrdersDeliveryState();
}

class _ContainerDateTimeInfoOrdersDeliveryState
    extends State<ContainerDateTimeInfoOrdersDelivery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //padding: EdgeInsets.only(top:15),
            width: widget.size.width * 0.30,
            height: 100,
            //color: Colors.green,
            child: Text(widget.day == null ? '' : widget.day,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xffB5B8CA),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    fontFamily: 'AvenirLight')),
          ),
          GestureDetector(
            onTap: () => {
              //buildShowModalBottomSheet(context)
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDeepInfo(
                      timeStart: widget.timeStart,
                      totQuantityCothes:widget.check,
                      timeEnd: widget.timeEnd,
                      orderId: widget.orderId,
                      directions:widget.directions,
                      courierId: widget.courierId,
                      phoneUser:widget.phoneUser
                    ),
                  ))
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffEEEEF5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              padding: EdgeInsets.only(top: widget.size.width * 0.05),
              width: widget.size.width * 0.70,
              height: 100,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('#' + widget.orderId.toString(),
                            style: TextStyle(
                                color: Color(0xff505165),
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                fontFamily: 'AvenirLight')),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 25),
                        child: Row(
                          children: [
                            Icon(Icons.av_timer_outlined,
                                color: Color(0xffB5B8CA)),
                            Text(widget.timeStart + ' - ' + widget.timeEnd,
                                style: TextStyle(
                                    color: Color(0xffB5B8CA),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0,
                                    fontFamily: 'AvenirLight')),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 15),
                        child: Text(widget.check.toString(),
                            style: TextStyle(
                                color: Color(0xffB5B8CA),
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                fontFamily: 'AvenirLight')),
                      )
                    ],
                  )
                ],
              ),
              // color: Colors.orange,
            ),
          )
        ],
      ),
    );
  }
}
