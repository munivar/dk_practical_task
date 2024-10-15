abstract class DemoState {}

class InitialState extends DemoState {}

class LoadingState extends DemoState {}

class LoadedState extends DemoState {}

class ErrorState extends DemoState {
  final String message;
  ErrorState(this.message);
}
