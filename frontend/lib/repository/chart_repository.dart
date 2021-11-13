import 'package:frontend/models/data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class IChartRepository {
  Future<List<BuildingData>> getAllInverters();
}

class ChartRepository implements IChartRepository {
  @override
  Future<List<BuildingData>> getAllInverters() async {
    final response =
        await http.get(Uri.parse('http://192.168.0.121:3000/monitor'));

    if (response.statusCode == 200) {
      print("response " + response.body);
      var json = jsonDecode(response.body);

      List<BuildingData> list = [];

      (json['tags'] as List).map((tagJson) {
        list.add(BuildingData.fromJson(tagJson));
      }).toList();

      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
