import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/view_models/generic_cubits/field_cubit/field_cubit.dart';

class GenericTextField<T> extends StatelessWidget {
  final FieldCubit<T> cubit;
  final String label;

  const GenericTextField({super.key, required this.cubit, required this.label});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit<T>, FieldState<T>>(
      bloc: cubit,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.value?.toString() ?? '',
          decoration: InputDecoration(
            labelText: label,
            errorText: state.errorText,
          ),
          onChanged: (val) => cubit.onChanged(val as T),
        );
      },
    );
  }
}
