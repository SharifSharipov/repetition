import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/data/models/post_model.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/domain/netowork/http_service.dart';

part 'update_post_state.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostInitial());
  void apiUpdatePost(PostModel post) async {
    emit(UpdatePostLoading());
    final response =
        await ApiServiceTwo.PUT(ApiServiceTwo.API_UPDATE, ApiServiceTwo.paramsUpdate(post));
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(errorText: "Could not update it is id->${post.id} posts"));
    }
  }
}
