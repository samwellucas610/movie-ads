import 'dart:convert';

import 'package:http/http.dart' as http;

Future getData(/*url*/) async {
  http.Response response = await http.get("https://yts.mx/api/v2/list_movies.json");//url
  print(">>>>>>>>>>>>>>>>>>>>>> data  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
  Map<String,dynamic> map = json.decode(response.body);
  print("================================separation==========================");
  print(">>>>  ${map["data"]["movies"][0]["title"]}<<<<<<<<");
  print(">>>>  ${map["data"]["movies"][0]["summary"]}<<<<<<<<");
  print("================================separation==========================");
 Map<String,dynamic> mapDetails = {};
 mapDetails["title"]= map["data"]["movies"][0]["title"];
 mapDetails["summary"]= map["data"]["movies"][0]["summary"];
 print(mapDetails);
  return mapDetails;
}