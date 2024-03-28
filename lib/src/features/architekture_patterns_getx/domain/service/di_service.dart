import 'package:get/get.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/manager/controllers/main_cantroller/main_cantroller.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/manager/controllers/splash_controller/splash_controller.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/manager/controllers/starter_controller/starter_controler.dart';

class DiService{
  static Future<void> init() async {
    //Get.put<MainController>(MainController());
    ////lazyPut kerak bo'gan payt ishlaydi boshqa payt emas
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<StarterController>(() => StarterController(), fenix: true);
  }
}