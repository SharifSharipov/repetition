part of 'create_post_cubit.dart';

@immutable
abstract class CreatePostState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreatePostInitial extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostLoaded extends CreatePostState {
  final bool isCreated;
  CreatePostLoaded({required this.isCreated});
}

class CreatePostError extends CreatePostState {
  final String errorText;
  CreatePostError({required this.errorText});
}
