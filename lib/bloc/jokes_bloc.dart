import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jokes/model/jokes_model.dart';
// import 'package:flutter_jokes/resource/api_repository.dart';

import '../services/jokes_services.dart';

part 'jokes_event.dart';
part 'jokes_state.dart';

// class JokesBloc extends Bloc<JokesEvent, JokesState> {
//   final JokesService service = JokesService();
//   JokesBloc() : super(JokesInitial()) {
//     on<JokesEvent>((event, emit) async {
//       emit(JokesLoading());
//       try {
//         final RandomJokesModel? result = await service.fetchJokes();
//         emit(JokesLoaded(result!));
//       } catch (e) {
//         emit(JokesError(e.toString()));
//       }
//     });
//   }
// }

/* Open AI Recommendation */
class JokesBloc extends Bloc<JokesEvent, JokesState> {
  final JokesService service = JokesService();

  JokesBloc() : super(JokesInitial()) {
    // Memanggil function _handleJokesEvent
    _handleJokesEvent();
  }

  /*Pisahkan dan buat function baru yang menampung JokesEvent */
  void _handleJokesEvent() {
    on<JokesEvent>(
      (event, emit) async {
        emit(JokesLoading());
        try {
          final RandomJokesModel? result = await service.fetchJokes();
          emit(JokesLoaded(result!));
        } catch (e) {
          emit(JokesError(e.toString()));
        }
      },
    );
  }
}
