import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/data/models/post_model.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/manager/create_post_cubit/create_post_cubit.dart';

import '../manager/update_post_cubit/update_post_cubit.dart';

Widget viewOfUpdate({
  required bool isLoading,
  required BuildContext context,
  required PostModel postModel,
  required TextEditingController titleController,
  required TextEditingController bodyController,
}) {
  return Container(
    padding: const EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                hintText: 'Body',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () {
                String title = titleController.text.trim();
                String body = bodyController.text.trim();
                PostModel updatedPost = postModel.copyWith(
                  title: title,
                  body: body,
                );
                BlocProvider.of<UpdatePostCubit>(context)
                    .apiUpdatePost(updatedPost);
                BlocProvider.of<CreatePostCubit>(context).callCreateBlocPattern(context);
              },
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Update Post",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox.shrink(),
      ],
    ),
  );
}
