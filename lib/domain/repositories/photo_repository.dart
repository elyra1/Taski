import 'dart:io';

abstract class PhotoRepository {
  Future<String?> setUserPhoto(File file);
  Future<void> removePhoto(String photoId);
}
