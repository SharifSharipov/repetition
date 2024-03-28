import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:repetition/src/config/routes/app_routes.dart';
import 'package:repetition/src/features/architekture_patterns_getx/data/models/post_model.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/manager/controllers/starter_controller/starter_controler.dart';

import '../widgets/views/item_start_post.dart';
class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<StarterController>().apiList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.navigateScreen);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title:const Text("Starter GetX"),
      ),
      body: GetBuilder<StarterController>(
        init: StarterController(), builder: (controller) { return Stack(children: [
          ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                PostModel post=controller.items[index];
                return itemStarterPost(controller, post);
          }),

          controller.isLoading ? const Center(
            child: CircularProgressIndicator(),
          )
              : const SizedBox.shrink(),
      ],); },
      ),
    );
  }
}
