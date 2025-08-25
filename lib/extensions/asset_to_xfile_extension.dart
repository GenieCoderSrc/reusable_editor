import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

extension AssetToXFileExtension on String {
  /// Loads this asset image into a temporary [XFile].
  ///
  /// Optionally provide a [fileName] to override the file name in the temp directory.
  /// Returns `null` if loading fails.
  Future<XFile?> loadAsXFile({String? fileName}) async {
    if (isEmpty) return null;

    try {
      // Load asset bytes
      final ByteData byteData = await rootBundle.load(this);
      final Uint8List bytes = byteData.buffer.asUint8List();

      // Prepare temporary file
      final Directory tempDir = await getTemporaryDirectory();
      final String name = fileName ?? split('/').last;
      final String filePath = '${tempDir.path}/$name';
      final File file = File(filePath);

      // Write bytes to file (flush ensures it's written fully)
      await file.writeAsBytes(bytes, flush: true);

      return XFile(file.path);
    } catch (e, stackTrace) {
      debugPrint('❌ AssetToXFileExtension | loadAsXFile | Error: $e');
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }
}
