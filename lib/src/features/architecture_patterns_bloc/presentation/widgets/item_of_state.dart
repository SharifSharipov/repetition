import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/data/models/post_model.dart';

import '../manager/cantroller/cubit.dart';
import '../manager/create_post_cubit/create_post_cubit.dart';

Widget viewPostLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget viewPostLoaded(List<PostModel> items) {
  return ListView.builder(
      itemBuilder: (context, index) {
        return itemOfPostCubit(items[index]);
      },
      itemCount: items.length);
}

Widget viewPostError({required String error}) {
  return Center(
    child: Text(error),
  );
}

Widget itemOfPostCubit( PostModel post) {
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
                BlocProvider.of<CreatePostCubit>(context).callCreatePage(context);
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
                BlocProvider.of<ListPostCubit>(context).apiPostDelete(post);
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