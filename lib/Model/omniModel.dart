import 'dart:convert';

OMNIModel omniModelFromJson(String str) => OMNIModel.fromJson(json.decode(str));

String omniModelToJson(OMNIModel data) => json.encode(data.toJson());

class OMNIModel {
  OMNIModel({
    this.name,
    this.income,
  });

  String? name;
  double? income;

  factory OMNIModel.fromJson(Map<String, dynamic>? json) => OMNIModel(
        name: json!["name"] ?? "test",
        income: (json["income"] ?? 0) * 1.0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "income": income,
      };
}

class TESTMODEL {
  String value;
  String date;
  double expenses;
  double? month;
  double? day;
  double? week;

  TESTMODEL({
    required this.value,
    required this.date,
    required this.expenses,
    required this.day,
    required this.month,
    required this.week,
  });

  factory TESTMODEL.fromJson(Map<String, dynamic> json) => TESTMODEL(
        value: json['value'],
        date: json['date'],
        expenses: (json["expenses"] ?? 0) * 1.0,
        month: json['month'],
        day: json['day'],
        week: json['week'],
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'date': date,
        'expenses': expenses,
        'month': month,
        'day': day,
        'week': week
      };
}

class TESTMODEL2 {
  String value;
  String date;
  double expenses;

  TESTMODEL2({
    required this.value,
    required this.date,
    required this.expenses,
  });

  factory TESTMODEL2.fromJson(Map<String, dynamic> json) => TESTMODEL2(
        value: json['value'],
        date: json['date'],
        expenses: (json["expenses"] ?? 0) * 1.0,
      );

  Map<String, dynamic> toJson() =>
      {'value': value, 'date': date, 'expenses': expenses};
}
