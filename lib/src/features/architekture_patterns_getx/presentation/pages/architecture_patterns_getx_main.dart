import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/manager/controllers/main_cantroller/main_cantroller.dart';
import '../../../../config/routes/app_routes.dart';
import '../widgets/views/item_two.dart';

class ArchitecturePatternsMain extends StatefulWidget {
  static const String id="/architecture_patterns_main";
  const ArchitecturePatternsMain({Key? key}) : super(key: key);

  @override
  State<ArchitecturePatternsMain> createState() => _ArchitecturePatternsMainState();
}

class _ArchitecturePatternsMainState extends State<ArchitecturePatternsMain> {


  @override
  void initState() {
    super.initState();
      Get.find<MainController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Architecture Patterns GetX Main"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.navigateScreen);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Obx(() => Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return itemOfPost(Get.find<MainController>(),Get.find<MainController>().items[index]);
            },
            itemCount: Get.find<MainController>().items.length,
          ),
          Get.find<MainController>().isLoading.value
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : const SizedBox.shrink(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement your functionality here
        },
        focusColor: Colors.amberAccent,
        child: const Icon(Icons.add),
      ),
    );
  }

}
