import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/firestore_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl({required this.firebaseAuthService, required this.databaseService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
       user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity=UserEntity(uId: user.uid, name: name, email: email);
      await addUserData(user: userEntity);

      return right(userEntity);
    } on CustomException catch (e) {
      if(user!=null){
        await firebaseAuthService.deleteUser();
      }
      return left(ServerFailure(e.message));
    }catch(e){
      if(user!=null){
        await firebaseAuthService.deleteUser();
      }
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword : ${e.toString()}');
      return left(ServerFailure("حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقاً."));

    }
  }


  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email,
      String password,
      ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity=await getUserData(uId: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }catch(e){
      log('Exception in AuthRepoImpl.signInWithEmailAndPassword : ${e.toString()}');
      return left(ServerFailure(e.toString()));

    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity=UserModel.fromFirebaseUser(user);

      var isUserExist=await databaseService.checkIfDataExists( path: BackendEndpoint.isUserExist, documentId: user.uid);
      if(isUserExist){
        await getUserData(uId: user.uid);
      }else{
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    }catch(e){
      if(user!=null){
        await firebaseAuthService.deleteUser();
      }
      log('Exception in AuthRepoImpl.signInWithGoogle : ${e.toString()}');
      return left(ServerFailure("حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقاً."));

    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity=UserModel.fromFirebaseUser(user);
      var isUserExist=await databaseService.checkIfDataExists( path: BackendEndpoint.isUserExist, documentId: user.uid);
      if(isUserExist){
        await getUserData(uId: user.uid);
      }else{
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    }catch(e){
      if(user!=null){
        await firebaseAuthService.deleteUser();
      }
      log('Exception in AuthRepoImpl.signInWithFacebook : ${e.toString()}');
      return left(ServerFailure("حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقاً."));

    }
  }

  @override
  Future<dynamic> addUserData({required UserEntity user}) async {
    await databaseService.addData(path: BackendEndpoint.addUserData, data: user.toMap(),documentId: user.uId);
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData= await databaseService.getData(path: BackendEndpoint.getUserData, documentId: uId);
    return UserModel.fromJson(userData);
  }

}
