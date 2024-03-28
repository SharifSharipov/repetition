import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repetition/src/config/routes/app_routes.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/manager/update_post_cubit/update_post_cubit.dart';
class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Update update"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.navigateScreen);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body:BlocBuilder<UpdatePostCubit, UpdatePostState>(builder: (BuildContext context, UpdatePostState state) {  },) ,
    );
  }
}
