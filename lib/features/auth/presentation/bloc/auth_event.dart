abstract class AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}

class GetCurrentUserEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}
