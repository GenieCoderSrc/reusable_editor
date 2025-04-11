import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

extension ImageLoader on String {
  Future<Uint8List> loadAssetImage() async {
    try {
      ByteData data = await rootBundle.load(this);
      return data.buffer.asUint8List();
    } catch (e, stacktrace) {
      debugPrint(
          'ImageLoader | loadAssetImage | error: $e stacktrace: $stacktrace');
      return Uint8List(0);
    }
  }
}
