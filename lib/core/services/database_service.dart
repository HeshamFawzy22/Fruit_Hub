abstract class DatabaseService {
  Future<void> addData({required String path, required Map<String, dynamic> data});
  Future<void> updateData({required String path, required Map<String, dynamic> data});
  Future<void> deleteData({required String path});
}