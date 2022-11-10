import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'omniModel.dart';

class OMNIController extends GetxController {
  var DATA = <TESTMODEL>[].obs;
  var DATA2 = <TESTMODEL2>[].obs;

  @override
  void onInit() {
    List? store = GetStorage().read<List>('DATA');

    if (!store.isNull) {
      DATA = store!.map((e) => TESTMODEL.fromJson(e)).toList().obs;
    }
    ever(DATA, (_) {
      GetStorage().write('DATA', DATA.toList());
    });

    List? store2 = GetStorage().read<List>('DATA2');

    if (!store2.isNull) {
      DATA2 = store2!.map((e) => TESTMODEL2.fromJson(e)).toList().obs;
    }
    ever(DATA2, (_) {
      GetStorage().write('DATA2', DATA2.toList());
    });

    super.onInit();
  }

  double total = 0;
  double total2 = 0;
  double total3 = 0;

  void buildTotal() {
    double sum = 0.0;
    double sum1 = 0.0;
    for (var i = 0; i < DATA2.length; ++i) {
      sum += DATA2[i].expenses;
    }
    for (var i = 0; i < DATA.length; ++i) {
      sum1 += DATA[i].expenses;
    }
    total = sum;
    total2 = sum1;
  }
}
