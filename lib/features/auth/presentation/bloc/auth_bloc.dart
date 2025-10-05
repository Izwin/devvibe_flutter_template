import 'package:devvibe_template/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthState.initial()) {
    on<SignInWithGoogleEvent>(_onSignInWithGoogle);
    on<GetCurrentUserEvent>(_onGetCurrentUser);
    on<SignOutEvent>(_onSignOut);
  }

  Future<void> _onSignInWithGoogle(
      SignInWithGoogleEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    final result = await authRepository.signInWithGoogle();
    result.fold(
          (failure) => emit(state.copyWith(status: AuthStatus.failure, errorMessage: failure.message)),
          (user) => emit(state.copyWith(status: AuthStatus.authenticated, user: user)),
    );
  }

  Future<void> _onGetCurrentUser(
      GetCurrentUserEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    final result = await authRepository.getCurrentUser();
    result.fold(
          (failure) => emit(state.copyWith(status: AuthStatus.failure, errorMessage: failure.message)),
          (user) {
        if (user != null) {
          emit(state.copyWith(status: AuthStatus.authenticated, user: user));
        } else {
          emit(state.copyWith(status: AuthStatus.unauthenticated, user: null));
        }
      },
    );
  }

  Future<void> _onSignOut(
      SignOutEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    final result = await authRepository.signOut();
    result.fold(
          (failure) => emit(state.copyWith(status: AuthStatus.failure, errorMessage: failure.message)),
          (_) => emit(AuthState.initial().copyWith(status: AuthStatus.logout)),
    );
  }
}
