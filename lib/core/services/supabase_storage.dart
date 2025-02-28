import 'dart:io';

import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'backend_points.dart';
import 'package:path/path.dart' as b;

class SupBaseService implements StorageService {
  static late Supabase _supabase;

  static intiSupaBase() async {
    _supabase = await Supabase.initialize(
      url: BackgroundPoints.supaBaseUrl,
      anonKey: BackgroundPoints.supaBaseKey,
    );
  }
  static createBucket(String bucketName) async {
    await _supabase.client.storage.createBucket(bucketName);
  }
  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var storageResponse = await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName.$extensionName', file);
    return storageResponse;
  }
}
