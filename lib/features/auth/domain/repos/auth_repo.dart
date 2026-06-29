import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword(String email,String password,String name);
}