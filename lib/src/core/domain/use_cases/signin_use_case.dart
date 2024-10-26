import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_test/src/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app_test/src/core/error/error.dart';

class SigninUseCase {
  final FirebaseAuthRepository _firebaseAuthRepository;

  SigninUseCase({required FirebaseAuthRepository firebaseAuthRepository})
      : _firebaseAuthRepository = firebaseAuthRepository;

  Future<Either<Failure, UserCredential>> call(String email, String password) {
    return _firebaseAuthRepository.signin(email, password);
  }
}
