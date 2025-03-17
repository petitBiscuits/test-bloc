import 'package:bloc_pattern_example/data/repository/user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final UserRepo userRepo;

  GlobalBloc({required this.userRepo}) : super(GlobalInitial()) {
    on<GlobalFetchData>(_onGlobalFetchData);
    on<GlobalAddData>(_onGlobalAddData);
  }

  void _onGlobalFetchData(GlobalFetchData event, Emitter<GlobalState> emit) async {
    emit(GlobalLoading());
    try {
      final String userName = await userRepo.getUserName();
      emit(GlobalLoaded(userName, 0));
    } catch (e) {
      emit(GlobalError(e.toString()));
    }
  }

  void _onGlobalAddData(GlobalAddData event, Emitter<GlobalState> emit) async {
    emit(GlobalLoading());
    try {
      userRepo.addUserName(event.text);
      final String userName = await userRepo.getUserName();
      emit(GlobalLoaded(userName, 1));
    } catch (e) {
      emit(GlobalError(e.toString()));
    }
  }
}
