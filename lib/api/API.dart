import 'dart:convert';

import 'package:http/http.dart' as http;
//returns a map of title and summary of movie
Future getData() async {
  http.Response response = await http.get("https://yts.mx/api/v2/list_movies.json");
  Map<String,dynamic> map = json.decode(response.body);
 Map<String,dynamic> mapDetails = {};
 mapDetails["title"]= map["data"]["movies"][0]["title"];
 mapDetails["summary"]= map["data"]["movies"][0]["summary"];
 print(mapDetails);
  return mapDetails;
}