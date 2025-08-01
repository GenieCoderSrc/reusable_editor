import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/reusable_editor.dart';

class TextFieldBlocBuilder extends StatelessWidget {
  const TextFieldBlocBuilder({
    super.key,
    required this.bloc,
    required this.builder,
  });

  final TextFieldCubit bloc;
  final Widget Function(BuildContext context, FieldState<String> state) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFieldCubit, FieldState<String>>(
      bloc: bloc,
      builder: builder,
    );
  }
}

