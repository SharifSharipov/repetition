import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/data/models/post_model.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/domain/netowork/http_service.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/manager/cantroller/state.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit() : super(ListPostInit());
  void apiPostList() async {
    emit(ListPostLoading());
    final response = await ApiServiceTwo.GET(ApiServiceTwo.API_LIST, ApiServiceTwo.paramsEmpty());
    if (response != null) {
      emit(ListPostLoaded(postList: ApiServiceTwo.parsePostList(response)));
    } else {
      emit(ListPostError(errorText: "Could not fetch posts"));
    }
  }
  void apiPostDelete(PostModel postModel)async{
    emit(ListPostLoading());
    final response=await ApiServiceTwo.DELETE(ApiServiceTwo.API_DELETE+postModel.id.toString(), ApiServiceTwo.paramsEmpty());
    if(response!=null){
      emit(ListPostLoaded(postList: ApiServiceTwo.parsePostList(response)));
    }else{
      emit(ListPostError(errorText: "Could not delete it is id->${postModel.id} posts"));
    }
  }

}
