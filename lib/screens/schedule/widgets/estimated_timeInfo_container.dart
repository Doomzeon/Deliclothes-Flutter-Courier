
import 'package:flutter/material.dart';

class EstimatedTimeInfoContainer extends StatelessWidget {
  final String shopName, shopStreet,shopCity;
  final int quantityClothes,shopCap;
  const EstimatedTimeInfoContainer({
    Key key, this.shopName, this.shopStreet, this.shopCap, this.shopCity, this.quantityClothes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.pink,
      width: size.width * 0.7,
      height: 130,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xff505165)))),
      child: Column(
        children: [
          Container(
            width: size.width * 0.7,
            padding: EdgeInsets.only(top: 10, left: 15),
            child: Text(shopName,
                style: TextStyle(
                    color: Color(0xff0E0E16),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    fontFamily: 'AvenirRegular')),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 3, left: 15),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Color(0xff505165),
                  size: 15,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 15),
                child: Text(quantityClothes.toString()+' vestiti',
                    style: TextStyle(
                        color: Color(0xff505165),
                        //fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        fontFamily: 'AvenirRegular')),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 15),
            width: size.width * 0.7,
            child: Text(shopStreet,
                style: TextStyle(
                    color: Color(0xff505165),
                    //fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    fontFamily: 'AvenirRegular')),
          ),
          Container(
            padding: EdgeInsets.only(top: 2, left: 15),
            width: size.width * 0.7,
            child: Text(shopCity+' '+shopCap.toString(),
                style: TextStyle(
                    color: Color(0xff505165),
                    //fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    fontFamily: 'AvenirRegular')),
          )
        ],
      ),
    );
  }
}