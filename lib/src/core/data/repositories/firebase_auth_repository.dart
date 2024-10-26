import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_test/src/core/core.dart';
import 'package:flutter_app_test/src/core/error/failure.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final FirebaseRemoteDataSource _remoteDataSource;

  FirebaseAuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserCredential>> signin(String email, String password) async {
    try {
      final remote = await _remoteDataSource.signin(email, password);
      return Right(remote);
    } on Exception catch (e) {
      return Left(Failure(message: "Une erreur s'est produite"));
    }
  }
}
