import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/view_models/field_cubits/field_cubit/field_cubit.dart';

// ✅ File Picker
class AppFilePicker extends StatelessWidget {
  final FieldCubit<File> cubit;
  final String label;
  final List<String>? allowedExtensions;
  final bool allowMultiple;

  const AppFilePicker({
    super.key,
    required this.cubit,
    required this.label,
    this.allowedExtensions,
    this.allowMultiple = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit<File>, FieldState<File>>(
      bloc: cubit,
      builder:
          (_, state) => ListTile(
            title: Text(label),
            subtitle: Text(
              state.value?.path.split('/').last ?? 'No file selected',
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.attach_file),
            onTap: () async {
              final result = await FilePicker.platform.pickFiles(
                allowMultiple: allowMultiple,
                type:
                    allowedExtensions == null ? FileType.any : FileType.custom,
                allowedExtensions: allowedExtensions,
              );
              if (result != null && result.files.isNotEmpty) {
                final file = File(result.files.single.path!);
                cubit.onChanged(file);
              }
            },
          ),
    );
  }
}
