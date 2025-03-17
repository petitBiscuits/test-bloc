part of 'global_bloc.dart';


sealed class GlobalEvent extends Equatable {
  const GlobalEvent();
}


final class GlobalFetchData extends GlobalEvent {
  const GlobalFetchData();

  @override
  List<Object> get props => [];
}

final class GlobalAddData extends GlobalEvent {
  const GlobalAddData({required this.text});

  final String text;

  @override
  List<Object> get props => [];
}