import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reusable_editor/styles/form_text_styles.dart';
import 'package:reusable_editor/view_models/field_cubit/field_cubit.dart';

// ✅ Date Picker
/// A widget for selecting a date using a FieldCubit<DateTime>.
///
/// Displays a label, the selected date (formatted), and allows users
/// to tap to open a date picker.
class AppDatePicker extends StatelessWidget {
  final FieldCubit<DateTime> cubit;
  final String labelText; // Changed from hintText to labelText for clarity
  final String placeholderText; // New parameter for when no date is selected
  final DateFormat formatter; // Renamed to displayFormatter for clarity

  const AppDatePicker({
    super.key,
    required this.cubit,
    required this.labelText,
    this.placeholderText = 'Tap to pick date', // Default placeholder
    required this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit<DateTime>, FieldState<DateTime>>(
      bloc: cubit,
      builder:
          (_, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the label text
              if (labelText.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    labelText,
                    style:
                        Theme.of(
                          context,
                        ).textTheme.bodyLarge, // Adjust style as needed
                  ),
                ),
              ListTile(
                title: Text(
                  state.value != null
                      ? formatter.format(
                        state.value!,
                      ) // Format the selected date
                      : placeholderText, // Use placeholder when no date is selected
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final now = DateTime.now();
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: state.value ?? now,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    cubit.update(picked);
                  }
                },
                // Display error text if validation fails
                subtitle:
                    state.errorText != null
                        ? Text(
                          state.errorText!,
                          style:
                              AppFormTextStyles
                                  .errorTextStyle, // Ensure this style is defined
                        )
                        : null,
              ),
              // Add a divider or line below the list tile for better visual separation
              const Divider(height: 1),
            ],
          ),
    );
  }
}
