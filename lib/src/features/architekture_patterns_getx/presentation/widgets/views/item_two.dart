import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:repetition/src/features/architekture_patterns_getx/data/models/post_model.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/manager/controllers/main_cantroller/main_cantroller.dart';
Widget itemOfPost(MainController controller, PostModel post) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 10),
    child: Card(
      child: Slidable(
        key: Key(post.id.toString()),
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
                controller.apiPostDelete(post);
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
          title: Text(post.title?.toUpperCase() ?? ""),
          subtitle: Text(post.body ?? ""),
        ),
      ),
    ),
  );
}
