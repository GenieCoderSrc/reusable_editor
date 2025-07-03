import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/styles/app_form_text_styles.dart';
import 'package:reusable_editor/view_models/field_cubit/field_cubit.dart';

// ✅ Switch
class AppSwitch extends StatelessWidget {
  final FieldCubit<bool> cubit;
  final String label;

  const AppSwitch({super.key, required this.cubit, required this.label});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit<bool>, FieldState<bool>>(
      bloc: cubit,
      builder:
          (_, state) => SwitchListTile(
            value: state.value ?? false,
            onChanged: cubit.update,
            title: Text(label),
            subtitle:
                state.errorText != null
                    ? Text(
                      state.errorText!,
                      style: AppFormTextStyles.errorTextStyle,
                    )
                    : null,
          ),
    );
  }
}
