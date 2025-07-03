// 📁 lib/shared/widgets/field/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/styles/app_form_text_styles.dart';
import 'package:reusable_editor/view_models/field_cubit/field_cubit.dart';

// ✅ String Based Text Input Field
class AppTextField extends StatelessWidget {
  final FieldCubit<String> cubit;
  final String label;
  final String? hintText;
  final bool autofocus;
  final TextInputType keyboardType;
  final int? maxLines;
  final bool obscureText;
  final InputDecoration? decoration;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    required this.cubit,
    required this.label,
    this.hintText,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.obscureText = false,
    this.decoration,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit<String>, FieldState<String>>(
      bloc: cubit,
      builder:
          (_, state) => TextFormField(
            autofocus: autofocus,
            initialValue: state.value ?? '',
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            style: AppFormTextStyles.formFieldTextStyle,
            decoration:
                decoration?.copyWith(
                  labelText: label,
                  hintText: hintText,
                  errorText: state.errorText,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                ) ??
                InputDecoration(
                  labelText: label,
                  hintText: hintText,
                  errorText: state.errorText,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                ),
            onChanged: cubit.update,
          ),
    );
  }
}
