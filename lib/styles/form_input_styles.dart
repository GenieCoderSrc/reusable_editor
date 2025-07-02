import 'package:flutter/material.dart';

/// A utility class providing predefined styles for `InputDecoration`.
/// This helps maintain consistency across form fields in your application.
class InputDecorationStyles {
  /// Defines the standard padding for the content within an input field.
  /// Used across all decoration styles for consistent spacing.
  static const EdgeInsets fieldPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );

  /// Creates a standard `InputDecoration` with an outlined border.
  ///
  /// [label]: The primary text label for the input field.
  /// [hintText]: Placeholder text displayed when the input is empty.
  /// [prefixIcon]: An optional icon displayed at the beginning of the input field.
  /// [suffixIcon]: An optional icon displayed at the end of the input field.
  /// [errorText]: Text displayed below the input field when there's an error.
  static InputDecoration inputDecoration({
    required String label,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? errorText,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hintText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      // Applies a rounded outline border to the input field.
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: fieldPadding,
    );
  }

  /// Creates a `InputDecoration` with a filled background and an outlined border.
  ///
  /// [label]: The primary text label for the input field.
  /// [hintText]: Placeholder text displayed when the input is empty.
  /// [prefixIcon]: An optional icon displayed at the beginning of the input field.
  /// [suffixIcon]: An optional icon displayed at the end of the input field.
  /// [errorText]: Text displayed below the input field when there's an error.
  static InputDecoration filledDecoration({
    required String label,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? errorText,
  }) {
    return InputDecoration(
      filled: true, // Enables the filled background.
      fillColor: Colors.grey.shade100, // Sets the background color.
      labelText: label,
      hintText: hintText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      // Applies a slightly rounded outline border.
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: fieldPadding,
    );
  }

  /// Creates an `InputDecoration` with an underline border.
  ///
  /// [label]: The primary text label for the input field.
  /// [hintText]: Placeholder text displayed when the input is empty.
  /// [prefixIcon]: An optional icon displayed at the beginning of the input field.
  /// [suffixIcon]: An optional icon displayed at the end of the input field.
  /// [errorText]: Text displayed below the input field when there's an error.
  static InputDecoration underlineDecoration({
    required String label,
    String? hintText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hintText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      // Uses a simple underline border.
      border: const UnderlineInputBorder(),
      contentPadding: fieldPadding,
    );
  }
}
