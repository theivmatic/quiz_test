import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';

class I {
  static final _applicationDocumentsDirectory =
      getApplicationDocumentsDirectory();

  static Future<String> savePickedImageToAppFolder(File image) async {
    final directory = await _applicationDocumentsDirectory;
    final path = directory.path;
    final relativePath =
        '/${DateTime.now().millisecondsSinceEpoch}${Path.extension(image.path)}';

    final newPath = '$path$relativePath';

    final res = await image.copy(newPath);

    return res.existsSync() ? relativePath : '';
  }

  static String getDocumentsPathByRelativePath(String relativePath) {
    return relativePath.isNotEmpty
        ? '$_applicationDocumentsDirectory $relativePath'
        : '';
  }
}
