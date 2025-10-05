import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devvibe_template/core/theme/bloc/theme_bloc.dart';
import 'package:devvibe_template/core/theme/data/repository/theme_repository_impl.dart';
import 'package:devvibe_template/core/theme/domain/repository/theme_repository.dart';
import 'package:devvibe_template/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:devvibe_template/features/auth/data/repository/auth_repository_impl.dart';
import 'package:devvibe_template/features/auth/domain/repository/auth_repository.dart';
import 'package:devvibe_template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:devvibe_template/l10n/bloc/locale_cubit.dart';
import 'package:devvibe_template/l10n/data/repository/local_repository_impl.dart';
import 'package:devvibe_template/l10n/domain/repository/locale_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => GoogleSignIn.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  // DataSources
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(
          firebaseAuth: sl(),
          googleSignIn: sl(),
          firebaseFirestore: sl()
        ),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<ThemeRepository>(
        () => ThemeRepositoryImpl(),
  );

  sl.registerLazySingleton<LocaleRepository>(
        () => LocaleRepositoryImpl(),
  );

  // Blocs / Cubits
  sl.registerFactory(() => AuthBloc(sl()));
  sl.registerFactory(() => ThemeBloc(sl()));
  sl.registerFactory(() => LocaleCubit(sl()));
}
