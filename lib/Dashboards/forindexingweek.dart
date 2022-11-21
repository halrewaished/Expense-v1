import 'package:expense_project/Dashboards/forindexing.dart';
import 'package:expense_project/Model/GetxController.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'Dashboard.dart';
import 'package:collection/collection.dart';

class ForIndexingWeek {
  final double x;
  final double y;
  ForIndexingWeek({required this.x, required this.y});
}

List<ForIndexingWeek> get indexingg {
  List<ForIndexingWeek> weeklist = [];
  List<double> totals = [];
  List<double> keyss = [];
  Map<double, double> totalkey = {};
  double total = 0;

  final OMNIController Controller = Get.put(OMNIController());
  final data = Controller.DATA.value;
  var groupbymonth = groupBy(data, ((p0) => p0.week));
  groupbymonth.removeWhere((key, value) => key == null);
  final date = DateTime.now();
  final startweekdate =
      getWeek(date.subtract(Duration(days: date.weekday - 1)));

  final endweekdate =
      getWeek(date.add(Duration(days: DateTime.daysPerWeek - date.weekday)));

  DateFormat format = DateFormat('yyyy-MM-dd');
  print("start: $startweekdate");
  print("end: $endweekdate");
  groupbymonth.forEach((keys, value) {
    total = value.fold(0, (total, element) {
      final compareddate = format.parse(element.date);
      if (startweekdate.isBefore(compareddate) &&
              endweekdate.isAfter(compareddate) ||
          (startweekdate.month == compareddate.month &&
              startweekdate.day == compareddate.day) ||
          (endweekdate.month == compareddate.month &&
              endweekdate.day == compareddate.day)) {
        return total + element.expenses;
      }
      return total + 0;
    });
    keyss.add(keys!);
    totals.addIf(total != 0, total);

    print(totals);
    for (int i = 0; i < totals.length; i++) {
      totalkey[keyss[i]] = totals[i];

      weeklist = totalkey.entries
          .map((e) => ForIndexingWeek(x: e.key.toDouble(), y: e.value))
          .toList()
        ..sort(((a, b) => a.x.compareTo(b.x)));
      ;
    }
  });

  return weeklist;
}

DateTime getWeek(DateTime d) => DateTime(d.year, d.month, d.day);
