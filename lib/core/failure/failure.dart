abstract class Failure {
  final String message;

  Failure({required this.message});
}

class AuthFailure extends Failure{
  AuthFailure({required super.message});
}