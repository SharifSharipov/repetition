import 'package:get/get.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/manager/controllers/main_cantroller/main_cantroller.dart';

class BindingService extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}
