import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repos/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> loginUser(
      String email,
      String password,
      ) async {
    emit(LoginLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email,
      password,
    );
    result.fold(
          (failure) => emit(LoginFailure(message: failure.message)),
          (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
}