import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/styles/app_form_text_styles.dart';
import 'package:reusable_editor/view_models/field_cubit/field_cubit.dart';

// ✅ Range Slider
class AppRangeSlider extends StatelessWidget {
  final FieldCubit<RangeValues> cubit;
  final double min;
  final double max;
  final String label;
  final int? divisions;

  const AppRangeSlider({
    super.key,
    required this.cubit,
    required this.label,
    required this.min,
    required this.max,
    this.divisions,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit<RangeValues>, FieldState<RangeValues>>(
      bloc: cubit,
      builder:
          (_, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label),
              RangeSlider(
                values: state.value ?? RangeValues(min, max),
                min: min,
                max: max,
                divisions: divisions,
                onChanged: cubit.onChanged,
              ),
              if (state.errorText != null)
                Text(state.errorText!, style: AppFormTextStyles.errorTextStyle),
            ],
          ),
    );
  }
}
