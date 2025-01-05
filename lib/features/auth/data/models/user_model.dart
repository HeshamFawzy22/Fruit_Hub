import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.name, required super.email});

  // Factory constructor to create UserModel from Firebase user data
  factory UserModel.fromFirebase(User user) => UserModel(
        id: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
      );
}
