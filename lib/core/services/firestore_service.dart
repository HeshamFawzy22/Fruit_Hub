import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/database_service.dart';

class FirestoreService implements DatabaseService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }
  
  @override
  Future<void> updateData({required String path, required Map<String, dynamic> data}) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<void> deleteData({required String path}) {
    throw UnimplementedError();
  }
}