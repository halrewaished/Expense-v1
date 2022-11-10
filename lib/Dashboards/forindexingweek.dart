import 'package:expense_project/Dashboards/forindexing.dart';
import 'package:expense_project/Model/GetxController.dart';
import 'package:get/get.dart';
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

  groupbymonth.forEach((keys, value) {
    total = value.fold(0, (total, element) => total + element.expenses);
    keyss.add(keys!);
    totals.add(total);

    print(totals);
    for (int i = 0; i < totals.length; i++) {
      totalkey[keyss[i]] = totals[i];
      print(totalkey);
      weeklist = totalkey.entries
          .map((e) => ForIndexingWeek(x: e.key.toDouble(), y: e.value))
          .toList()
        ..sort(((a, b) => a.x.compareTo(b.x)));
      ;

      print(totals[i]);
    }
  });

  return weeklist;
}
