import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final double? borderRadius;
  final bool? filled;

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
    this.borderRadius,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFieldCubit, TextFieldState>(
      bloc: bloc,
      builder: (context, state) {
        return TextFormField(
          controller: bloc.controller,
          autofocus: autofocus,
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: textInputAction,
          maxLines: maxLines,
          obscureText: obscureText,
          onChanged: bloc.onChanged,
          validator: bloc.formFieldValidator,
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            errorText: state.isDirty ? state.errorText : null,
            filled: filled,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? 8,
              ), // ✅ default 8
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
        );
      },
    );
  }
}
