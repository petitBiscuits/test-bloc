part of 'global_bloc.dart';

sealed class GlobalState extends Equatable{}

final class GlobalInitial extends GlobalState {
  @override
  List<Object> get props => [];
}

final class GlobalLoading extends GlobalState {@override
List<Object> get props => [];}

final class GlobalLoaded extends GlobalState {
  final String user_name;
  final int counter;

  GlobalLoaded(this.user_name, this.counter);
  @override
  List<Object> get props => [user_name, counter];
}

final class GlobalError extends GlobalState {
  final String message;

  GlobalError(this.message);
  @override
  List<Object> get props => [message];
}