import 'package:flutter/material.dart';
import 'package:movie_ads/api/API.dart';

import 'productpage.dart';

class ProductsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductsPageState();
  }

}
class _ProductsPageState extends State<ProductsPage>{

  List<dynamic> list;
  @override
    void initState()  {
       getData().then((value) => setState(() {
        list = value;
      }));
       print("elements in array are initState  $list");
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    //print("elements in array are buildcontext  ${list.length}");
    //itemCount = entries.length;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: Text(
            "Movies",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
        ),
        body: list != null
            ? ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async{
                      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductPage(
                  list[index]["image_url"],
                  list[index]["name"],
                  list[index]["Brand"],
                  )),
              );
                    },
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          FadeInImage(
                            image: NetworkImage(list[index]["image_url"]), //product.image
                            placeholder: AssetImage('assets/food.jpg'),
                            height: 300.0,
                            fit: BoxFit.cover,
                          ),
                          //  _buildTitlePriceRow(),
                          //  AddressTag('Union Square, San Francisco'),
                          //  _buildActionButtons(context)
                        ],
                      ),
                    ),
                  );
                },
              )
            : const Center(child: Text('internet please...!')));
  }
}

// ListTile(
//                     title: Text('Item ${index + 1}'),
//                   ) "https://firebasestorage.googleapis.com/v0/b/flutter-products-c24f0.appspot.com/o/images%2F02240370-cf9c-405e-bb05-c1f82b4bb4f5-image_cropper_1619777043197.jpg?alt=media&token=02240370-cf9c-405e-bb05-c1f82b4bb4f5"