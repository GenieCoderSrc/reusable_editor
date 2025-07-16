import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/styles/app_form_text_styles.dart';
import 'package:reusable_editor/view_models/field_cubit/field_cubit.dart';

// ✅ Slider

/// A widget for selecting a numerical value using a `FieldCubit<double>`.
///
/// Displays a label, the current value (formatted by displayValue),
/// and a slider for interaction.
class AppSlider extends StatelessWidget {
  final FieldCubit<double> cubit;
  final double min;
  final double max;
  final int? divisions;
  final String labelText; // Renamed from label to labelText for consistency
  final String Function(double value)
  displayValue; // New parameter to format the current value for display

  const AppSlider({
    super.key,
    required this.cubit,
    required this.min,
    required this.max,
    required this.labelText,
    required this.displayValue, // This is now required
    this.divisions,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit<double>, FieldState<double>>(
      bloc: cubit,
      builder:
          (_, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the label and the current formatted value
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    labelText,
                    style:
                        Theme.of(
                          context,
                        ).textTheme.bodyLarge, // Adjust style as needed
                  ),
                  Text(
                    displayValue(state.value ?? min),
                    // Display the formatted current value
                    style:
                        Theme.of(
                          context,
                        ).textTheme.bodyMedium, // Adjust style as needed
                  ),
                ],
              ),
              Slider(
                value: state.value ?? min,
                // Use min if value is null
                min: min,
                max: max,
                divisions: divisions,
                onChanged: (newValue) {
                  cubit.update(newValue);
                },
              ),
              // Display error text if validation fails
              if (state.errorText != null)
                Text(
                  state.errorText!,
                  style:
                      AppFormTextStyles
                          .errorTextStyle, // Ensure this style is defined
                ),
            ],
          ),
    );
  }
}
