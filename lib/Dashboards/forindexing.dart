import 'dart:collection';

import 'package:expense_project/Dashboards/forindexing.dart';
import 'package:expense_project/Model/GetxController.dart';
import 'package:get/get.dart';
import 'Dashboard.dart';
import 'package:collection/collection.dart';

class ForIndexing {
  final double x;
  final double y;
  ForIndexing({required this.x, required this.y});
}

List<ForIndexing> get indexingg {
  List<ForIndexing> monthlist = [];
  List<double> totals = [];
  List<double> keyss = [];
  Map<double, double> totalkey = {};
  double total = 0;
  final OMNIController Controller = Get.put(OMNIController());
  final data = Controller.DATA.value;

  var groupbymonth = groupBy(data, ((p0) => p0.month));
  groupbymonth.removeWhere((key, value) => key == null);
  groupbymonth.forEach((keys, value) {
    total = value.fold(0, (total, element) => total + element.expenses);
    keyss.add(keys!);
    totals.add(total);

    for (int i = 0; i < totals.length; i++) {
      totalkey[keyss[i]] = totals[i];

      monthlist = totalkey.entries
          .map((e) => ForIndexing(x: e.key, y: e.value))
          .toList()
        ..sort(((a, b) => a.x.compareTo(b.x)));
    }
  });

  return monthlist;
}