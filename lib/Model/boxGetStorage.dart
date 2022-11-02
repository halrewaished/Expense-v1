import 'dart:developer';
import 'package:get_storage/get_storage.dart';

import 'omniModel.dart';

class OMNI {
  static final shared = OMNI();

  final _box = GetStorage();

  OMNIModel? current;

  Future<OMNIModel?> get() async {
    try {
      return _box.read('current') == "" ? null : omniModelFromJson(_box.read('current'));
    } catch (e) {
      log(e.toString());
    }
  }

  set({required OMNIModel? OMNI}) async {
    try {
      if (OMNI == null) {
        _box.remove('current');
        current = null;
        return;
      }
      await _box.write('current', omniModelToJson(OMNI));
    } catch (e) {
      log(e.toString());
    }
  }
}
