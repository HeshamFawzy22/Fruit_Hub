// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:fruits_hub/core/errors/custom_exception.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImp({
    required this.firebaseAuthService,
    required this.databaseService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserModel.fromFirebase(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImp.createUserWithEmailAndPassword: ${e.toString()}');
      return left(const ServerFailure('لقد حدث خطأ. يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImp.signInWithEmailAndPassword: ${e.toString()}');
      return left(const ServerFailure('لقد حدث خطأ. يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(
        UserModel.fromFirebase(user),
      );
    } catch (e) {
      log(
        'Exception in AuthRepoImp.signInWithGoogle: ${e.toString()}',
      );
      return left(const ServerFailure('لقد حدث خطأ. يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(
        UserModel.fromFirebase(user),
      );
    } catch (e) {
      log(
        'Exception in AuthRepoImp.signInWithFacebook: ${e.toString()}',
      );
      return left(const ServerFailure('لقد حدث خطأ. يرجى المحاولة مرة أخرى'));
    }
  }
  
  @override
  Future addUserData({required UserEntity user}) async{
    await databaseService.addData(path: BackendEndpoint.addUserData, data: user.toMap());
  }
}
