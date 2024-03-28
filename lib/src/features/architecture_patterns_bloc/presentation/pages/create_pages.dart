import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/manager/create_post_cubit/create_post_cubit.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/widgets/veiw_of_post_create.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  _finish(BuildContext context){
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      Navigator.pop(context, "result");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Page"),
      ),
      body: BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (BuildContext context, CreatePostState state) {
          if (state is CreatePostLoading) {
            return viewPostCreate(
              isLoading: true,
              context: context,
              titleController: titleController,
              bodyController: bodyController,
            );
          } else if (state is CreatePostLoaded) {
            // Finish and navigate to the next page
            _finish(context);
            return Container(); // Return an empty container for now
          } else if (state is CreatePostError) {
            // Handle error state if needed
            return viewPostCreate(
              isLoading: false,
              context: context,
              titleController: titleController,
              bodyController: bodyController,
            );
          }
          // Return default state
          return viewPostCreate(
            isLoading: false,
            context: context,
            titleController: titleController,
            bodyController: bodyController,
          );
        },
      ),
    );
  }

}
