import 'package:flutter/material.dart';

class EnumOptionEntity<T extends Enum> {
  final T? type;
  final IconData? icon;
  final String? label;
  final Color? iconColor;

  EnumOptionEntity({this.type, this.icon, this.label, this.iconColor});
}
