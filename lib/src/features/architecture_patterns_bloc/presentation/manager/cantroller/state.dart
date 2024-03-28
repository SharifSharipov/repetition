import 'package:equatable/equatable.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/data/models/post_model.dart';

abstract class ListPostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ListPostInit extends ListPostState {}

class ListPostLoading extends ListPostState {}

class ListPostLoaded extends ListPostState {
  final List<PostModel> postList;
  ListPostLoaded({required this.postList});
}
class ListPostError extends ListPostState{
  final String errorText;
  ListPostError({required this.errorText});
}