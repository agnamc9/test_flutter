import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseRemoteDataSource {
  Future<UserCredential> signin(String email, String password);
}

class FirebaseRemoteDataSourceImpl extends FirebaseRemoteDataSource {
  final FirebaseAuth _auth;

  FirebaseRemoteDataSourceImpl({required FirebaseAuth auth}) : _auth = auth;

  @override
  Future<UserCredential> signin(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
