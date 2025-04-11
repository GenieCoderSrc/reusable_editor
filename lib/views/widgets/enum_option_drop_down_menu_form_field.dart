import 'package:reusable_editor/domain/entities/enum_option_entity.dart';
import 'package:flutter/material.dart';

class EnumOptionDropDownMenuFormField<T extends Enum> extends StatelessWidget {
  final EnumOptionEntity<T>? selectedValue;
  final void Function(EnumOptionEntity<T>?) onChanged;
  final String hint;
  final List<EnumOptionEntity<T>> dropdownItems;
  final Widget Function(EnumOptionEntity<T>)? itemBuilder;

  const EnumOptionDropDownMenuFormField({
    super.key,
    required this.dropdownItems,
    this.itemBuilder,
    required this.selectedValue,
    required this.onChanged,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<EnumOptionEntity<T>>(
      value: selectedValue,
      onChanged: onChanged,
      items: dropdownItems.map<DropdownMenuItem<EnumOptionEntity<T>>>((option) {
        return DropdownMenuItem<EnumOptionEntity<T>>(
          value: option,
          child: itemBuilder != null
              ? itemBuilder!(option)
              : Row(
                  children: [
                    Icon(option.icon),
                    const SizedBox(width: 8),
                    Text(option.label ?? option.type?.name ?? ""),
                  ],
                ),
        );
      }).toList(),
      hint: Text(hint),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
