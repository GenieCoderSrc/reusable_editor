import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle, ByteData;
import 'package:path_provider/path_provider.dart';

extension AssetImageToFile on String? {
  /// Loads an asset image as a [File] by writing it into the temp directory.
  /// Returns `null` if the asset path is invalid or an error occurs.
  Future<File?> loadAsFile() async {
    final String? assetPath = this;
    if (assetPath == null || assetPath.isEmpty) return null;

    try {
      // Extract the file name from the asset path
      final String assetFileName = assetPath.split('/').last;

      // Load asset as bytes
      final ByteData data = await rootBundle.load(assetPath);
      final Uint8List bytes = data.buffer.asUint8List();

      // Get the temporary directory
      final Directory tempDir = await getTemporaryDirectory();
      final String tempPath = '${tempDir.path}/$assetFileName';

      // Write the bytes into a temp file
      final File tempFile = File(tempPath);
      await tempFile.writeAsBytes(bytes, flush: true);

      return tempFile;
    } catch (e, stackTrace) {
      debugPrint(
        '❌ AssetImageToFile | Error converting asset to File: $e\n$stackTrace',
      );
      return null;
    }
  }
}
