import 'dart:convert';

class InverterData {
  String name;
  double value;
  String unit;

  InverterData({required this.name, required this.value, required this.unit});

  InverterData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        value = json['value'],
        unit = json['unit'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
        'unit': unit,
      };
}

class Inverter {
  String name;
  List<InverterData> data;

  Inverter({required this.name, required this.data});

  Inverter.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        data = (json['data'] as List)
            .map((tagJson) => InverterData.fromJson(tagJson))
            .toList();
}

class BuildingData {
  String timestamp;
  List<Inverter> inverters;

  BuildingData({required this.timestamp, required this.inverters});

  BuildingData.fromJson(Map<String, dynamic> json)
      : timestamp = json['timestamp'],
        inverters = (json['inverters'] as List)
            .map((tagJson) => Inverter.fromJson(tagJson))
            .toList();
}
