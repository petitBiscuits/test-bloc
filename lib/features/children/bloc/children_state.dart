part of 'children_bloc.dart';

class ChildrenState extends Equatable {
  const ChildrenState({
    required this.children,
    this.selectedChild,
  });

  final List<Child> children;
  final Child? selectedChild;


  ChildrenState copyWith({
    List<Child>? children,
    Child? selectedChild,
  }) {
    return ChildrenState(
      children: children ?? this.children,
      selectedChild: selectedChild ?? this.selectedChild,
    );
  }

  @override
  List<Object?> get props => [children, selectedChild];
}
