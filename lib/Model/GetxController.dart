import 'package:expense_project/Model/extensions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../page/home.dart';
import 'boxGetStorage.dart';
import 'omniModel.dart';

class OMNIController extends GetxController {
  var DATA = <EXPENCEMODEL>[].obs;
  var DATA2 = <SAVINGMODEL>[].obs;
  String? selectItem = 'اخـتر نسبـة الإدخـار';

  String? selectedItem = 'التسوق';
  String date = DateTime.now().toString().changeDateFormat();


  double? income;
  double? income2;

  final itemsList = ['اخـتر نسبـة الإدخـار','10', '20', '30', '40'];

  void calcRating(item) {

    if (item == '10') {
        // income = income! * 0.9;
        income2 = (income! * 0.1);
        update();
      }

    if(item == '20'){
      income2 = (income! * 0.2);
      update();
    }

    if(item == '30'){
      income2 = (income! * 0.3);
      update();
    }

    if(item == '40'){
      income2 = (income! * 0.4);
      update();
    }

  }

  @override
  void onInit() {
    List? store = GetStorage().read<List>('DATA');

    if (!store.isNull) {
      DATA = store!.map((e) => EXPENCEMODEL.fromJson(e)).toList().obs;
    }
    ever(DATA, (_) {
      GetStorage().write('DATA', DATA.toList());
    });

    List? store2 = GetStorage().read<List>('DATA2');

    if (!store2.isNull) {
      DATA2 = store2!.map((e) => SAVINGMODEL.fromJson(e)).toList().obs;
    }
    ever(DATA2, (_) {
      GetStorage().write('DATA2', DATA2.toList());
    });

    super.onInit();
  }

  double total = 0;
  var total2 = 0;
  double total3 = 0;



  void buildTotal() {
    double sum = 0.0;
    var sum1 = 0.0;

    for (var i = 0; i < DATA2.length; ++i) {
      // sum += DATA2[i].saving;
      sum = sum + income2!;
    }

    for (var i = 0; i < DATA.length; ++i) {
      sum1 += DATA[i].expenses;
    }
    total = sum;
    total2 = int.parse(sum1.round().toString());
    update();
  }
}
