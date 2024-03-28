import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/data/models/post_model.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/manager/create_post_cubit/create_post_cubit.dart';

Widget viewPostCreate(
    {required bool isLoading,
    required BuildContext context,
    required TextEditingController titleController,
    required TextEditingController bodyController}) {
  return Container(
    padding: const EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  /* border: OutlineInputBorder(),*/
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                  /* border: OutlineInputBorder(),*/
                  hintText: 'Body',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () {
                String title = titleController.text.toString().trim();
                String body = bodyController.text.toString().trim();
                PostModel post = PostModel(
                  id: 0,
                  title: title,
                  body: body,
                  userId: 0,
                );
                PostModel updatePost = post.copyWith(title: body, body: title, id: 1);
                BlocProvider.of<CreatePostCubit>(context).apiCreated(updatePost);
              },
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text("Create a post"),
              ),
            )
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
