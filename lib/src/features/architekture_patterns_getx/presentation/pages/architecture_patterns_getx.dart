import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/manager/controllers/home_controllers/home_controllers.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/widgets/views/item_home_of_post.dart';
import '../../../../config/routes/app_routes.dart';
class ArchitecturePatternsGetX extends StatefulWidget {
  const ArchitecturePatternsGetX({super.key});

  @override
  State<ArchitecturePatternsGetX> createState() => _ArchitecturePatternsGetXState();
}

class _ArchitecturePatternsGetXState extends State<ArchitecturePatternsGetX> {
  final _controller = Get.put(HomeControllers());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Architecture Patterns GetX"),
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
                  return itemOfPost(_controller, _controller.items[index]);
                },
                itemCount: _controller.items.length,
              ),
              _controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink(),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        focusColor: Colors.amberAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
