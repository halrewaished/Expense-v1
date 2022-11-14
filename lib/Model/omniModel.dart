import 'dart:convert';

OMNIModel omniModelFromJson(String str) => OMNIModel.fromJson(json.decode(str));

String omniModelToJson(OMNIModel data) => json.encode(data.toJson());

class OMNIModel {
  OMNIModel({
    this.name,
    this.income,
    this.income2,
  });

  String? name;
  double? income;
  double? income2;

  factory OMNIModel.fromJson(Map<String, dynamic>? json) => OMNIModel(
        name: json!["name"] ?? "test",
        income: (json["income"] ?? 0) * 1.0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "income": income,
      };
}

class EXPENCEMODEL {
  String value;
  String date;
  double expenses;
  double? month;
  double? day;
  double? week;

  EXPENCEMODEL({
    required this.value,
    required this.date,
    required this.expenses,
    required this.day,
    required this.month,
    required this.week,
  });

  factory EXPENCEMODEL.fromJson(Map<String, dynamic> json) => EXPENCEMODEL(
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

class SAVINGMODEL {
  String value;
  String date;

  // String textSaving;

  SAVINGMODEL({
    required this.value,
    required this.date,
    // required this.textSaving,
  });

  factory SAVINGMODEL.fromJson(Map<String, dynamic> json) => SAVINGMODEL(
        value: json['value'],
        date: json['date'],
        // textSaving: json["textSaving"],
      );

  Map<String, dynamic> toJson() => {'value': value, 'date': date};
}
