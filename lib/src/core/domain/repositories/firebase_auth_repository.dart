import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_test/src/core/error/error.dart';

abstract class FirebaseAuthRepository {
  Future<Either<Failure, UserCredential>> signin(String email, String password);
}
