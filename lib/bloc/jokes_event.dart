part of 'jokes_bloc.dart';

// Event = Input
abstract class JokesEvent extends Equatable {
  const JokesEvent();
}

// buat class
class GetJokesData extends JokesEvent {
  @override
  List<Object> get props => [];
}
