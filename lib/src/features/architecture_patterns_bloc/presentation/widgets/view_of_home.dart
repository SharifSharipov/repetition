import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/data/models/post_model.dart';

import 'item_of_state.dart';

Widget viewOfHome(List<PostModel> items, bool isLoading) {
  return Stack(children: [
    ListView.builder(
        itemBuilder: (context, index) {
          PostModel post = items[index];
          print("post $post");
          return itemOfPostCubit(post);
        },
        itemCount: items.length),
    isLoading
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : const SizedBox.shrink(),
  ]);
}