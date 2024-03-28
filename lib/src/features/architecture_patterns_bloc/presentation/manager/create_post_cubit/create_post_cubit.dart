import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/data/models/post_model.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/domain/netowork/http_service.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/manager/cantroller/cubit.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/pages/create_pages.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/pages/update_page.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInitial());
  void apiCreated(PostModel post) async {
    emit(CreatePostLoading());
    final response =
        await ApiServiceTwo.POST(ApiServiceTwo.API_CREATE, ApiServiceTwo.paramsCreate(post));
    if (response != null) {
      emit(CreatePostLoaded(isCreated: false));
    } else {
      emit(CreatePostError(errorText: "Could not create it is id->${post.id} posts"));
    }
  }

  void callCreatePage(BuildContext context) async {
    var result =
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreatePage()));
    if (result != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }

  void callUpdatePage(BuildContext context) async {
    var result =
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UpdatePage()));
    if (result != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }
}
