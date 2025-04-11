import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

extension AssetImageToFile on String? {
  Future<File?> loadAsFile() async {
    try {
      final String? assetPath = this;
      if (assetPath != null) {
        // Get the asset file name
        List<String> pathParts = assetPath.split('/');
        String assetFileName = pathParts.last;

        // Load the asset image as a ByteData
        ByteData data = await rootBundle.load(assetPath);

        // Convert ByteData to Uint8List
        Uint8List bytes = data.buffer.asUint8List();

        // Get the temporary directory using path_provider
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = tempDir.path;

        // Write the bytes to a temporary file using the asset file name
        File tempFile = File('$tempPath/$assetFileName');
        await tempFile.writeAsBytes(bytes);

        return tempFile;
      }
      return null;
    } catch (e) {
      debugPrint(
          'AssetImageToFile | loadAsFile | Error loading asset as file: $e');
      return null;
    }
  }
}
