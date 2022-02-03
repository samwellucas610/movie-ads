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

  String title;
  String summary;
  @override
    void initState()  {
       getData().then((mapDetails) => setState(() {
        title = mapDetails['title'];
        summary = mapDetails['summary'];
      }));
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
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
        body: title == null?Center(child: CircularProgressIndicator(),):
        ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async{
                      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductPage(title,summary
                  )),
              );
                    },
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.movie),
                            title: Text(title),
                            subtitle: Text('learn more ...'),
                          
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
    );
  }
}
