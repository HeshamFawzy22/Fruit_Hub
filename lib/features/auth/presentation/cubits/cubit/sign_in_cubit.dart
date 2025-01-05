// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(
    this.authRepo,
  ) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());
    final result =
        await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(
        SignInFailure(message: failure.message),
      ),
      (userEntity) => emit(
        SignInSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(
        SignInFailure(message: failure.message),
      ),
      (userEntity) => emit(
        SignInSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(
        SignInFailure(message: failure.message),
      ),
      (userEntity) => emit(
        SignInSuccess(userEntity: userEntity),
      ),
    );
  }
}
