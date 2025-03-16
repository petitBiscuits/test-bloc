part of 'web_bloc.dart';

sealed class WebEvent extends Equatable {
  const WebEvent();
}

class FetchWebData extends WebEvent {
  const FetchWebData();

  @override
  List<Object> get props => [];
}
