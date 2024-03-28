part of 'update_post_cubit.dart';

@immutable
abstract class UpdatePostState  extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdatePostInitial extends UpdatePostState {}
class UpdatePostLoading extends UpdatePostState {}
class UpdatePostLoaded extends UpdatePostState {
  final bool isUpdated;
  UpdatePostLoaded({required this.isUpdated});
}
class UpdatePostError extends UpdatePostState {
  final String errorText;
  UpdatePostError({required this.errorText});
}
