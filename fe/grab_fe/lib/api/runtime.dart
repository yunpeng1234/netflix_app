import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../class/linechartprop.dart';

Future<LineChartProp> getRuntime(startYear, endYear) async {
  var url = Uri.http('XXXXX:8000', '/runtime/', {'startYear': startYear.toString(), 'endYear': endYear.toString()});
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
    List<List<double>> temp = jsonResponse.map((e) => [double.parse(e['release_year']), double.parse(e['average_runtime'])]).toList();
    temp.sort((a, b) => (a[0] - b[0]).round());
    return Future.value(convertToData(temp));
  } 
  return Future.value(LineChartProp([]));
}

LineChartProp convertToData(List<List<double>> data) {
  return LineChartProp(data);
}