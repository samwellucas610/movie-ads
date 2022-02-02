import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  ProductPage();
  Widget _buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'available At Netflix ',
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '|',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          '\Tsh' + price.toString(),
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
            appBar: AppBar(

              title: Text("something"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildAddressPriceRow(400000),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "some details",
                    textAlign: TextAlign.center,
                  ),
                 )
              ],
            ),
          ));
        

  }
}
