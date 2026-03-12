import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/styles/app_form_text_styles.dart';
import 'package:reusable_editor/view_models/generic_cubits/field_cubit/field_cubit.dart';

class AppRadioGroup<T> extends StatelessWidget {
  final FieldCubit<T> cubit;
  final String label;
  final List<T> values;
  final List<String> labels;

  // Configuration & Styling
  final bool toggleable;
  final Color? activeColor;
  final WidgetStateProperty<Color?>? fillColor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool isThreeLine;
  final bool? dense;
  final ListTileControlAffinity controlAffinity;
  final bool autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final ShapeBorder? shape;
  final Color? tileColor;
  final Color? selectedTileColor;
  final VisualDensity? visualDensity;
  final bool? enableFeedback;
  final double radioScaleFactor;
  final ListTileTitleAlignment? titleAlignment;
  final bool? enabled;
  final Color? radioBackgroundColor;
  final BorderSide? radioSide;
  final MouseCursor? mouseCursor;

  /// Optional builder for custom subtitles or secondary widgets per index
  final Widget Function(BuildContext context, int index)? subtitleBuilder;
  final Widget Function(BuildContext context, int index)? secondaryBuilder;

  const AppRadioGroup({
    super.key,
    required this.cubit,
    required this.label,
    required this.values,
    required this.labels,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.isThreeLine = false,
    this.dense,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.autofocus = false,
    this.contentPadding,
    this.shape,
    this.tileColor,
    this.selectedTileColor,
    this.visualDensity,
    this.enableFeedback,
    this.radioScaleFactor = 1.0,
    this.titleAlignment,
    this.enabled,
    this.radioBackgroundColor,
    this.radioSide,
    this.mouseCursor,
    this.subtitleBuilder,
    this.secondaryBuilder,
  }) : assert(values.length == labels.length, 'Values and Labels must have same length');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit<T>, FieldState<T>>(
      bloc: cubit,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),

          RadioGroup<T>(
            groupValue: state.value,
            onChanged: (T? newValue) {
              // Only update if newValue is not null or if toggleable is allowed
              if (newValue != null || toggleable) {
                cubit.onChanged(newValue as T);
              }
            },
            child: Column(
              children: List.generate(values.length, (index) {
                final value = values[index];
                final isSelected = state.value == value;

                return RadioListTile<T>(
                  value: value,
                  title: Text(labels[index]),
                  subtitle: subtitleBuilder?.call(context, index),
                  secondary: secondaryBuilder?.call(context, index),
                  selected: isSelected,
                  // --- Passed Arguments ---
                  toggleable: toggleable,

                  hoverColor: hoverColor,
                  overlayColor: overlayColor,
                  splashRadius: splashRadius,
                  materialTapTargetSize: materialTapTargetSize,
                  isThreeLine: isThreeLine,
                  dense: dense,
                  controlAffinity: controlAffinity,
                  autofocus: autofocus,
                  contentPadding: contentPadding,
                  shape: shape,
                  tileColor: tileColor,
                  selectedTileColor: selectedTileColor,
                  visualDensity: visualDensity,
                  enableFeedback: enableFeedback,
                  radioScaleFactor: radioScaleFactor,
                  titleAlignment: titleAlignment,
                  enabled: enabled ?? true,
                  activeColor: activeColor,
                  radioBackgroundColor: radioBackgroundColor != null
                      ? WidgetStateProperty.all(radioBackgroundColor)
                      : null,
                  // If you decide to add activeColor or tileColor,
                  // check if the specific Flutter version requires WidgetStateProperty for those too.
                  // Usually, activeColor remains a plain Color, but fillColor is a Property.
                  fillColor: fillColor ?? (activeColor != null
                      ? WidgetStateProperty.all(activeColor)
                      : null),
                  radioSide: radioSide,
                  mouseCursor: mouseCursor,
                );
              }),
            ),
          ),

          if (state.errorText != null)
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 4),
              child: Text(
                state.errorText!,
                style: AppFormTextStyles.errorTextStyle,
              ),
            ),
        ],
      ),
    );
  }
}