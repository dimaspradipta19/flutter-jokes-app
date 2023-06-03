part of 'jokes_bloc.dart';

// jika ingin melihat response dari event, bisa dimasukkan pada state
abstract class JokesState extends Equatable {
  const JokesState();

  @override
  List<Object> get props => [];
}

class JokesInitial extends JokesState {}

class JokesLoading extends JokesState {}

class JokesLoaded extends JokesState {
  final RandomJokesModel jokesModel;
  const JokesLoaded(this.jokesModel);

  @override
  List<Object> get props => [jokesModel];
}

class JokesError extends JokesState {
  final String? error;
  const JokesError(this.error);
  
  @override
  List<Object> get props => [error!];
}
