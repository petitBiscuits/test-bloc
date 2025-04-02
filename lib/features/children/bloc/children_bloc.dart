import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_example/domain/model/child.dart';
import 'package:equatable/equatable.dart';

part 'children_event.dart';
part 'children_state.dart';

class ChildrenBloc extends Bloc<ChildrenEvent, ChildrenState> {
  ChildrenBloc() : super(ChildrenState(children: [], selectedChild: null)) {
    on<ChildrenEvent>(_onChildrenEvent);
    on<ChildrenInitialEvent>(_onInitial);
    on<ChildrenSelectChild>(_onSelectChild);
  }

  FutureOr<void> _onChildrenEvent(ChildrenEvent event, Emitter<ChildrenState> emit) {
    print("test");
  }

  FutureOr<void> _onInitial(ChildrenInitialEvent event, Emitter<ChildrenState> emit) {
    final children = <Child>[];

    for (var i = 0; i < 10; i++) {
      children.add(Child(
        id: i,
        name: 'Child $i',
        age: i + 10,
      ));
    }

    emit(state.copyWith(
      children: children,
      selectedChild: null,
    ));
  }

  FutureOr<void> _onSelectChild(ChildrenSelectChild event, Emitter<ChildrenState> emit) {
    emit(state.copyWith(
      selectedChild: event.child,
    ));
  }
}
