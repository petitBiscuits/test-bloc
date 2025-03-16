part of 'web_bloc.dart';

sealed class WebState extends Equatable {
  const WebState();
}

final class WebInitial extends WebState {
  const WebInitial();

  @override
  List<Object> get props => [];
}

final class WebLoading extends WebState {
  const WebLoading();

  @override
  List<Object> get props => [];
}

final class WebLoaded extends WebState {
  const WebLoaded({required this.response});
  final String response;

  @override
  List<Object> get props => [response];
}

final class WebError extends WebState {
  const WebError({required this.response});
  final String response;

  @override
  List<Object> get props => [response];
}