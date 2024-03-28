import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:repetition/src/features/architekture_patterns_getx/data/models/post_model.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/manager/controllers/splash_controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Get.find<SplashController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Get X"),
        centerTitle: true,
      ),
      body: GetX<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  PostModel post = controller.items[index];
                  return itemSplashPost(controller, post);
                },
              ),
              controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }

  Widget itemSplashPost(SplashController controller, PostModel post) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 10),
    child: Card(
      child: Slidable(
        key: Key(post.id.toString()), // Providing a unique key based on post ID
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                controller.apiPostUpdate(post);
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Update',
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                controller.apiPostUpdate(post);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
          title: Text(post.title.toUpperCase()),
          subtitle: Text(post.body),
        ),
      ),
    ),
  );
  }
}
