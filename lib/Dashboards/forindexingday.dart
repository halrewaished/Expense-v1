import 'package:expense_project/Dashboards/forindexing.dart';
import 'package:expense_project/Model/GetxController.dart';
import 'package:get/get.dart';
import 'Dashboard.dart';
import 'package:collection/collection.dart';

class ForIndexingDay {
  final double x;
  final double y;
  ForIndexingDay({required this.x, required this.y});
}

List<ForIndexingDay> get indexingg {
  List<ForIndexingDay> daylist = [];
  List<double> totals = [];
  List<double> keyss = [];
  List<double> tempkey = [];
  List<double> tempexpense = [];
  Map<double, double> totalkey = {};
  double total = 0;
  final OMNIController Controller = Get.put(OMNIController());
  final data = Controller.DATA.value;

  data.forEach((element) {
    if (element.day != null &&
        element.day == DateTime.now().day &&
        element.month == DateTime.now().month &&
        (element.year != null && element.year == DateTime.now().year)) {
      tempkey.add(element.day!.toDouble());
      tempexpense.add(element.expenses);
    }
  });
  for (int i = 0; i < tempkey.length; i++) {
    keyss.add(i.toDouble());
  }

  final Map<double, double> groupbymonth =
      Map.fromIterables(keyss, tempexpense);

  groupbymonth.forEach((key, value) {
    for (int i = 0; i < tempkey.length; i++) {
      totalkey[keyss[i]] = tempexpense[i];
      daylist = totalkey.entries
          .map((e) => ForIndexingDay(x: e.key.toDouble(), y: e.value))
          .toList()
        ..sort(((a, b) => a.x.compareTo(b.x)));
    }
  });

  return daylist;
}
