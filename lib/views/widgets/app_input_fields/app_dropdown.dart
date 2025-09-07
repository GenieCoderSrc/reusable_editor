import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/reusable_editor.dart';

// ✅ Dropdown
class AppDropdown<T> extends StatelessWidget {
  final FieldCubit<T> cubit;
  final String label;
  final List<DropdownMenuItem<T>> items;

  const AppDropdown({
    super.key,
    required this.cubit,
    required this.label,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit<T>, FieldState<T>>(
      bloc: cubit,
      builder: (_, state) => DropdownButtonFormField<T>(
        value: state.value,
        decoration: InputDecoration(
          labelText: label,
          errorText: state.errorText,
        ),
        items: items,
        onChanged: cubit.onChanged,
      ),
    );
  }
}
