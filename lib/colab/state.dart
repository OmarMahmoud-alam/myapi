abstract class NewsState {}

class InitNewState extends NewsState {}

class BottomNavState extends NewsState {}

class ArticBussinesState extends NewsState {}

class WaitBussinesState extends NewsState {}

class ErrorBussinesState extends NewsState {
  String? e;
  ErrorBussinesState({this.e});
}

class ArticsportsState extends NewsState {}

class WaitsportsState extends NewsState {}

class ErrorsportsState extends NewsState {
  String? e;
  ErrorsportsState({this.e});
}

class ArticscienceState extends NewsState {}

class WaitscienceState extends NewsState {}

class ErrorscienceState extends NewsState {
  String? e;
  ErrorscienceState({this.e});
}

class ChangemodeState extends NewsState {}

class ArticSearchState extends NewsState {}

class WaitSearchState extends NewsState {}

class ErrorSearchState extends NewsState {
  String? e;
  ErrorSearchState({this.e});
}
