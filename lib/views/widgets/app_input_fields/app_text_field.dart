import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/styles/app_form_text_styles.dart';
import 'package:reusable_editor/view_models/field_cubits/text_field_cubit/text_field_cubit.dart';

// ✅ String Based Text Input Field

class AppTextField extends StatelessWidget {
  final TextFieldCubit bloc;
  final String? label;
  final String? hintText;
  final bool autofocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final bool obscureText;

  final InputDecoration? decoration;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  // Border & fill config
  final bool? isUnderlined;
  final bool filled;
  final double? borderRadius;
  final InputBorder? border;
  final Color? borderColor;
  final double? borderWidth;

  final Widget Function(BuildContext context, TextFieldState state)? builder;

  const AppTextField({
    super.key,
    required this.bloc,
    this.label,
    this.hintText,
    this.autofocus = false,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.obscureText = false,
    this.decoration,
    this.prefixIcon,
    this.suffixIcon,
    this.builder,
    this.filled = true,
    this.borderRadius,
    this.border,
    this.isUnderlined = false,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFieldCubit, TextFieldState>(
      bloc: bloc,
      builder:
          builder ??
          (context, state) {
            return TextFormField(
              autofocus: autofocus,
              initialValue: state.value ?? '',
              obscureText: obscureText,
              keyboardType: keyboardType ?? TextInputType.text,
              textInputAction: textInputAction,
              maxLines: maxLines,
              style: AppFormTextStyles.formFieldTextStyle,
              onChanged: bloc.onChanged,
              validator: bloc.formFieldValidator,
              decoration: _buildEffectiveDecoration(state),
            );
          },
    );
  }

  InputDecoration _buildEffectiveDecoration(TextFieldState state) {
    final effectiveBorder = border ?? _buildDefaultBorder();
    return decoration?.copyWith(
          labelText: label,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorText: state.errorText,
          filled: filled,
          border: effectiveBorder,
          enabledBorder: effectiveBorder,
          focusedBorder: effectiveBorder,
        ) ??
        InputDecoration(
          labelText: label,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorText: state.errorText,
          filled: filled,
          border: effectiveBorder,
          enabledBorder: effectiveBorder,
          focusedBorder: effectiveBorder,
        );
  }

  InputBorder _buildDefaultBorder() {
    final color = borderColor ?? Colors.grey;
    final width = borderWidth ?? 1.0;
    final radius = borderRadius ?? 8.0;

    if (isUnderlined == true) {
      return UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
