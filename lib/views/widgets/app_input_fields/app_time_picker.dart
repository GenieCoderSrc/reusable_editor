import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/view_models/field_cubit/field_cubit.dart';

// ✅ Time Picker
class AppTimePicker extends StatelessWidget {
  final FieldCubit<TimeOfDay> cubit;
  final String labelText;
  final String? hintText;

  const AppTimePicker({super.key, required this.cubit, required this.labelText, this.hintText});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit<TimeOfDay>, FieldState<TimeOfDay>>(
      bloc: cubit,
      builder:
          (_, state) => ListTile(
            title: Text(labelText),
            subtitle: Text(
              state.value != null
                  ? state.value!.format(context)
                  : 'Tap to pick time',
            ),
            trailing: const Icon(Icons.access_time),
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: state.value ?? TimeOfDay.now(),
              );
              if (picked != null) cubit.update(picked);
            },
          ),
    );
  }
}
