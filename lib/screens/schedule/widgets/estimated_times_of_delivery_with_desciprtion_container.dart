import 'package:courier_app/models/directions.dart';
import 'package:courier_app/screens/schedule/widgets/estimated_timeInfo_container.dart';
import 'package:courier_app/screens/schedule/widgets/estimated_time_container_col.dart';
import 'package:flutter/material.dart';

class EstimatedTimesOfDeliveryWithDesciprtionContainer extends StatefulWidget {
    final List<Directions> directions;

  const EstimatedTimesOfDeliveryWithDesciprtionContainer({
    Key key, this.directions,
  }) : super(key: key);

  @override
  _EstimatedTimesOfDeliveryWithDesciprtionContainerState createState() =>
      _EstimatedTimesOfDeliveryWithDesciprtionContainerState();
}

class _EstimatedTimesOfDeliveryWithDesciprtionContainerState
    extends State<EstimatedTimesOfDeliveryWithDesciprtionContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          //   color: Colors.orange,
          width: size.width,
          margin: EdgeInsets.only(top: 10),
          height: widget.directions.length * 130.0,
          child: Row(
            children: [
              EstimatedTimeContainerCol(directions: widget.directions),
              InfoEstimatedTimeContainersCol(directions: widget.directions,),
              
            ],
          ),
        ),
      ),
    );
  }
}

class InfoEstimatedTimeContainersCol extends StatefulWidget {
  final List<Directions> directions;
  const InfoEstimatedTimeContainersCol({
    Key key, this.directions,
  }) : super(key: key);

  @override
  _InfoEstimatedTimeContainersColState createState() => _InfoEstimatedTimeContainersColState();
}

class _InfoEstimatedTimeContainersColState extends State<InfoEstimatedTimeContainersCol> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.7,
      // color: Colors.red,
      child: Column(
        children: [
          ...widget.directions.map((e) => EstimatedTimeInfoContainer(
            shopName: e.shopName,
            shopCap: e.cap,
            shopCity: e.city,
            shopStreet: e.street,
            quantityClothes: e.quantity
          ))
          //EstimatedTimeInfoContainer(),
         // EstimatedTimeInfoContainer(),
          //EstimatedTimeInfoContainer(),
          //EstimatedTimeInfoContainer()
        ],
      ),
    );
  }
}


