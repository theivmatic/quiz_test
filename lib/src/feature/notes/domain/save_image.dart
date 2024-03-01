// ignore_for_file: library_prefixes

import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:quiz_test/main.dart';

class I {
  static final _applicationDocumentsDirectory = MainApp.getDir();

  static Future<String> savePickedImageToAppFolder(File image) async {
    final path = await _applicationDocumentsDirectory;
    log('path: $path');
    final relativePath =
        '/${DateTime.now().millisecondsSinceEpoch}${Path.extension(image.path)}';
    log('relativePath: $relativePath');
    final newPath = '$path$relativePath';
    log('newPath: $newPath');

    final res = await image.copy(newPath);
    log('res: ${res.existsSync()}');
    return res.existsSync() ? relativePath : '';
    
  }

  static String getDocumentsPathByRelativePath(String relativePath) {
    return relativePath.isNotEmpty
        ? '$_applicationDocumentsDirectory$relativePath'
        : '';
  }
}
