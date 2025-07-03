import 'package:flutter/material.dart';

/// A utility class providing predefined `TextStyle` definitions for common text elements
/// throughout the application. This promotes consistency in typography.
class AppFormTextStyles {
  /// Text style for the input field's actual text content.
  static const TextStyle formFieldTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  /// Text style for error messages displayed below input fields.
  static const TextStyle errorTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.red,
  );

  /// Text style for input field labels.
  static const TextStyle labelStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  /// Text style for helper text displayed below input fields.
  static const TextStyle helperTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );

  /// Text style for prominent titles.
  static const TextStyle titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  /// Text style for subtitles or secondary headings.
  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );

  /// Text style for small captions or supplementary information.
  static const TextStyle captionStyle = TextStyle(
    fontSize: 12,
    color: Colors.black54,
  );

  /// Text style for clickable links.
  static const TextStyle linkStyle = TextStyle(
    fontSize: 14,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  /// Text style for disabled text or elements.
  static const TextStyle disabledTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  /// Text style for button labels.
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
