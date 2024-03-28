import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:repetition/src/features/architecture_patterns_provider/presentation/manager/home_view_model/home_view_model.dart';

import '../../data/models/post_model/post_mopel.dart';

Widget itemOfPost(HomeViewModel homeViewModel, PostModel post) {
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
                homeViewModel.apiPostUpdate(post);
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
                homeViewModel
                    .apiPostDelete(post)
                    .then((value) => {if (value) homeViewModel.apiPostList()});
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
