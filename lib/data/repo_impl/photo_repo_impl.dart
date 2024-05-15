import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/repositories/photo_repository.dart';
import 'package:uuid/uuid.dart';

@Singleton(as: PhotoRepository)
class PhotoRepoImpl implements PhotoRepository {
  final FirebaseStorage _firebaseStorage;

  PhotoRepoImpl(this._firebaseStorage);
  final path = "user_photos/";

  @override
  Future<String?> setUserPhoto(File file) async {
    final uuid = const Uuid().v4();
    final task = await _firebaseStorage.ref(path + uuid).putFile(file);
    if (task.state == TaskState.success) {
      return _firebaseStorage.ref(path + uuid).getDownloadURL();
    }
    return null;
  }

  @override
  Future<void> removePhoto(String photoId) async {
    await _firebaseStorage.ref(path + photoId).delete();
  }
}
