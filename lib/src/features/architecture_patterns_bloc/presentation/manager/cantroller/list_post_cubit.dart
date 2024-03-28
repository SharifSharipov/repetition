import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/data/models/post_model.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/domain/netowork/http_service.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/manager/cantroller/list_post_state.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/pages/update_page.dart';

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
  void callCreatePage(BuildContext context,PostModel postModel) async {
    var result = Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdatePage(postModel: postModel,)));
    if (result != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }


}
