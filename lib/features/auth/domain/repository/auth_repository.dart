import 'package:dartz/dartz.dart';
import 'package:devvibe_template/core/failure/failure.dart';
import 'package:devvibe_template/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, UserEntity?>> getCurrentUser();

  Future<Either<Failure, void>> signOut();
}
