import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/reusable_editor.dart';

class EnumMultiOptionCheckboxGroup<T extends Enum> extends StatelessWidget {
  final MultiEnumOptionCubit<T> cubit;

  final List<EnumOptionEntity<T>> options;

  final String? label;
  final String? errorText;

  final Axis direction;

  final double spacing;
  final double runSpacing;

  final Widget Function(
    BuildContext context,
    EnumOptionEntity<T> option,
    bool selected,
  )?
  itemBuilder;

  const EnumMultiOptionCheckboxGroup({
    super.key,
    required this.cubit,
    required this.options,
    this.label,
    this.errorText,
    this.itemBuilder,
    this.direction = Axis.vertical,
    this.spacing = 8,
    this.runSpacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultiEnumOptionCubit<T>, MultiEnumOptionState<T>>(
      bloc: cubit,
      builder: (context, state) {
        final children = options.map((option) {
          final selected = state.isSelected(option.type);

          if (itemBuilder != null) {
            return itemBuilder!(context, option, selected);
          }

          return InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => cubit.toggleOption(option.type),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: selected,
                  onChanged: (_) => cubit.toggleOption(option.type),
                ),

                if (option.icon != null) ...[
                  Icon(option.icon, size: 20, color: option.iconColor),
                  const SizedBox(width: 6),
                ],

                Text(option.label ?? option.type.name),
              ],
            ),
          );
        }).toList();

        Widget content;

        if (direction == Axis.horizontal) {
          content = Wrap(
            spacing: spacing,
            runSpacing: runSpacing,
            children: children,
          );
        } else {
          content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(bottom: runSpacing),
                    child: e,
                  ),
                )
                .toList(),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null) ...[
              Text(label!, style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 6),
            ],

            content,

            if (errorText != null) ...[
              const SizedBox(height: 6),
              Text(
                errorText!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
