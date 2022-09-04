import 'dart:convert';

CounterModel counterModelFromJson(String str) =>
    CounterModel.fromJson(json.decode(str));

String counterModelToJson(CounterModel data) => json.encode(data.toJson());

class CounterModel {
  CounterModel({
    required this.id,
    required this.color,
    required this.textColor,
    required this.value,
    required this.name,
    this.maxValue,
    this.increment = 1,
  });

  int id;
  int color;
  int textColor;
  double value;
  String name;
  double? maxValue;
  double increment;

  factory CounterModel.fromJson(Map<dynamic, dynamic> json) => CounterModel(
        id: json["_id"],
        color: json["color"],
        textColor: json["textColor"],
        value: json["value"],
        name: json["name"],
        maxValue: json["maxValue"],
        increment: json["increment"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "textColor": textColor,
        "value": value,
        "name": name,
        "maxValue": maxValue,
        "increment": increment,
      };
}
