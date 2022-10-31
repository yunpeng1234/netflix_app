import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import '../class/piechartprop.dart';

Future<PieChartProp> getSplit(year) async {
  var url = Uri.http('XXXXX:8000', '/split/', {"year" : year.toString()});
  final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  // Await the http get response, then decode the json-formatted response.
  final response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body)as List<dynamic>;
    return Future.value(convertToProp([int.parse(jsonResponse[0]['release_year']),int.parse(jsonResponse[0]['show_count']), int.parse(jsonResponse[0]['movie_count'])]));
  } else{
    print("Sss");
    return Future.value(PieChartProp(0,0,0));

  }
}

PieChartProp convertToProp(List<int> data) {
  return PieChartProp(data[0], data[1], data[2]);
}