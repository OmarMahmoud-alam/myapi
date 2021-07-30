abstract class NewsState {}

class InitNewState extends NewsState {}

class BottomNavState extends NewsState {}

class ArticBussinesState extends NewsState {}

class WaitBussinesState extends NewsState {}

class ErrorBussinesState extends NewsState {
  String? e;
  ErrorBussinesState({this.e});
}
