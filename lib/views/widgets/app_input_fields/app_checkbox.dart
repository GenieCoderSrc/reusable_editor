import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/reusable_editor.dart';

// ✅ Checkbox
class AppCheckbox extends StatelessWidget {
  final FieldCubit<bool> cubit;
  final String label;

  const AppCheckbox({super.key, required this.cubit, required this.label});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit<bool>, FieldState<bool>>(
      bloc: cubit,
      builder: (_, state) => CheckboxListTile(
        value: state.value ?? false,
        onChanged: cubit.onChanged,
        title: Text(label),
        subtitle: state.errorText != null
            ? Text(state.errorText!, style: AppFormTextStyles.errorTextStyle)
            : null,
      ),
    );
  }
}
