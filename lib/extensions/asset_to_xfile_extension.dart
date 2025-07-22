import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

extension AssetToXFileExtension on String {
  /// Loads the asset image at this [String] path into a temporary [XFile].
  ///
  /// Optionally override the [fileName] used in temp directory.
  /// Returns `null` if loading fails.
  Future<XFile?> loadAsXFile({String? fileName}) async {
    try {
      final ByteData byteData = await rootBundle.load(this);
      final Uint8List bytes = byteData.buffer.asUint8List();

      final Directory tempDir = await getTemporaryDirectory();
      final String name = fileName ?? split('/').last;
      final String filePath = '${tempDir.path}/$name';

      final File file = File(filePath);
      await file.writeAsBytes(bytes, flush: true);

      return XFile(file.path);
    } catch (e, stack) {
      debugPrint('AssetToXFileExtension | loadAsXFile | Error: $e');
      debugPrintStack(stackTrace: stack);
      return null;
    }
  }
}
