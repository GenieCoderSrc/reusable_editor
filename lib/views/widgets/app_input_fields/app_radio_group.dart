import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/styles/app_form_text_styles.dart';
import 'package:reusable_editor/view_models/field_cubit/field_cubit.dart';

// ✅ Radio Group
class AppRadioGroup<T> extends StatelessWidget {
  final FieldCubit<T> cubit;
  final String label;
  final List<T> values;
  final List<String> labels;

  const AppRadioGroup({
    super.key,
    required this.cubit,
    required this.label,
    required this.values,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit<T>, FieldState<T>>(
      bloc: cubit,
      builder:
          (_, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: Theme.of(context).textTheme.titleMedium),
              ...List.generate(values.length, (index) {
                return RadioListTile<T>(
                  value: values[index],
                  groupValue: state.value,
                  onChanged: cubit.onChanged,
                  title: Text(labels[index]),
                );
              }),
              if (state.errorText != null)
                Text(state.errorText!, style: AppFormTextStyles.errorTextStyle),
            ],
          ),
    );
  }
}
