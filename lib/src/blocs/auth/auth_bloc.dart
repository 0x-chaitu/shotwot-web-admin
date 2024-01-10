library auth;

import 'dart:developer';

import 'package:admin/src/repository/i_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_event.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuth _authFacade;

  AuthBloc(this._authFacade) : super(AuthInitalState()) {
    on<AuthEvent>((event, emit) {});

    on<SignOut>((event, emit) async {
      try {
        await _authFacade.logOut();
      } catch (e) {
        log(e.toString());
      }
    });

    on<Signin>((event, emit) async {
      emit(AuthLoadingState(isLoading: true));
      try {
        final bool status = await _authFacade.signIn(
            email: event.email, password: event.password);
        emitEvent(status, emit);
      } catch (e) {
        log(e.toString());
      }
      emit(AuthLoadingState(isLoading: false));
    });
  }

  void emitEvent(bool status, Emitter<AuthState> emit) {
    if (status) {
      emit(AuthSuccessState(status: status));
    } else {
      emit(AuthFailureState("user Signup failed!"));
    }
  }
}