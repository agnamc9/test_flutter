import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_test/src/core/core.dart';
import 'package:flutter_app_test/src/features/signin/presentations/cubits/cubits.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerFactory<FirebaseRemoteDataSource>(() => FirebaseRemoteDataSourceImpl(auth: sl()));

  sl.registerFactory<FirebaseAuthRepository>(() => FirebaseAuthRepositoryImpl(sl()));

  sl.registerFactory<SigninUseCase>(() => SigninUseCase(firebaseAuthRepository: sl()));

  sl.registerFactory<SigninCubit>(() => SigninCubit(sl()));
}
