
import 'package:courier_app/models/directions.dart';
import 'package:flutter/material.dart';

class EstimatedTimeContainerCol extends StatelessWidget {
  final List<Directions> directions;
  
  const EstimatedTimeContainerCol({
    Key key, this.directions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3,
      //margin: EdgeInsets.only(left: size.width * 0.1),
      // color: Colors.green,
      child: Stack(
        children: [

          Positioned(
              child: Container(
                  width: size.width * 0.01,
                  margin: EdgeInsets.only(left: size.width * 0.04),
                  decoration: BoxDecoration(
                      //color: Colors.pink,
                      border: Border(
                          left: BorderSide(
                              width: 0.5, color: Color(0xff505165)))))),
          
          for(var i =0;i<this.directions.length;i++)
          Positioned(
            top:i==0?25.0:(i*130)+25.0,
            left:7.0,
              child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50)))),
      
          for(var i =0;i<this.directions.length;i++)
          Positioned(
            top:i==0?27.0:(i*130)+27.0,
            left:40.0,
              child: Container(
                child: Text(this.directions[i].estimatedTimeArrives.toString(),style:TextStyle(
                    color: Color(0xff0E0E16),
                    //fontWeight: FontWeight.bold,
                    fontSize: 11.0,
                    fontFamily: 'AvenirRegular')),
              ),),

        ],
      ),
      
    );
  }
}