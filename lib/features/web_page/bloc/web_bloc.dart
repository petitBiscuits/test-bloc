import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_pattern_example/features/web_page/data/repository/web_repo.dart';
import 'package:equatable/equatable.dart';

part 'web_event.dart';

part 'web_state.dart';

class WebBloc extends Bloc<WebEvent, WebState> {
  WebBloc({required this.webRepo}) : super(WebInitial()) {
    on<FetchWebData>(_onFetchWebData);
  }

  final WebRepo webRepo;

  Future<void> _onFetchWebData(WebEvent event, Emitter<WebState> emit) async {
    emit(WebLoading());
    try {
      final response = await webRepo.fetchWebData();
      emit(WebLoaded(response: response));
    } catch (e) {
      emit(WebError(response: e.toString()));
    }
  }
}
