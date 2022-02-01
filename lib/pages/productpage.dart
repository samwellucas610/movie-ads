import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String Brand;
  ProductPage(this.imageUrl,this.name,this.Brand);
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

              title: Text(name),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FadeInImage(
                  image: NetworkImage(imageUrl),
                  placeholder: AssetImage('assets/food.jpg'),
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
                // Container(
                //   padding: EdgeInsets.all(10.0),
                //   child: TitleDefault(product.title),
                // ),
                _buildAddressPriceRow(400000),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    Brand,
                    textAlign: TextAlign.center,
                  ),
                 )
              ],
            ),
          ));
        

  }
}
