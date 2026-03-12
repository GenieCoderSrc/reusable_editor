import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/domain/entities/enum_option_entity.dart';
import 'package:reusable_editor/view_models/field_cubits/multi_enum_option_cubit/multi_enum_option_cubit.dart';

class EnumMultiOptionCheckboxGroup<T extends Enum> extends StatelessWidget {
  final MultiEnumOptionCubit<T> cubit;

  /// Optional custom item builder
  final Widget Function(
    BuildContext context,
    EnumOptionEntity<T> option,
    bool selected,
    VoidCallback toggle,
  )?
  itemBuilder;

  const EnumMultiOptionCheckboxGroup({
    super.key,
    required this.cubit,
    this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultiEnumOptionCubit<T>, MultiEnumOptionState<T>>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: state.options.map((option) {
            final bool selected = cubit.isSelected(option.type);

            final toggle = () => cubit.toggleOptionByType(option.type);

            if (itemBuilder != null) {
              return itemBuilder!(context, option, selected, toggle);
            }

            return CheckboxListTile(
              value: selected,
              onChanged: (_) => toggle(),
              title: Row(
                children: [
                  if (option.icon != null) Icon(option.icon),
                  if (option.icon != null) const SizedBox(width: 8),
                  Text(option.label ?? option.type.name),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
