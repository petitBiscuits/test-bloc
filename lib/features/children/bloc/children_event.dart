part of 'children_bloc.dart';

sealed class ChildrenEvent extends Equatable {
  const ChildrenEvent();
}

final class ChildrenInitialEvent extends ChildrenEvent {
  const ChildrenInitialEvent();

  @override
  List<Object?> get props => [];
}

final class ChildrenSelectChild extends ChildrenEvent {
  const ChildrenSelectChild({
    required this.child,
  });

  final Child child;

  @override
  List<Object?> get props => [child];
}