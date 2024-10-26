import 'package:flutter_app_test/src/features/signin/presentations/cubits/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';

class SigninCubit extends Cubit<SigninState> {
  final SigninUseCase _signinUseCase;

  SigninCubit(this._signinUseCase) : super(SigninInitial());

  signin({required String email, required String password}) async {
    emit(SigninInProgress());
    var response = await _signinUseCase(email, password);
    response.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (success) => emit(SigninSuccess()),
    );
  }
}
