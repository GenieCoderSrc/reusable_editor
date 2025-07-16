import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

/// A utility class providing consistent and customizable `InputDecoration` styles.
class InputDecorationStyles {
  /// Shared content padding across all input fields.
  static const EdgeInsets fieldPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );

  /// The default fill color for filled input decorations.
  static const Color defaultFillColor = Color(0xFFF5F5F5);

  /// Creates a base `InputDecoration` used by all variations.
  static InputDecoration _baseDecoration({
    required String label,
    String? hintText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    InputBorder? border,
    bool? filled,
    Color? fillColor,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hintText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: fieldPadding,
      border: border,
      filled: filled ?? false,
      fillColor: fillColor ?? defaultFillColor,
    );
  }

  /// Returns an outlined input style with optional rounded border radius.
  static InputDecoration outlined({
    required String label,
    String? hintText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    double? borderRadius,
  }) {
    return _baseDecoration(
      label: label,
      hintText: hintText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
    );
  }

  /// Returns a filled background style with optional border radius and color.
  static InputDecoration filled({
    required String label,
    String? hintText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    double? borderRadius,
    Color? fillColor,
  }) {
    return _baseDecoration(
      label: label,
      hintText: hintText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: fillColor ?? defaultFillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
    );
  }

  /// Returns an underlined input style, useful for minimal form inputs.
  static InputDecoration underlined({
    required String label,
    String? hintText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return _baseDecoration(
      label: label,
      hintText: hintText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: const UnderlineInputBorder(),
    );
  }
}
