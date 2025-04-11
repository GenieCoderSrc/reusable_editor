import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_editor/domain/entities/enum_option_entity.dart';
import 'package:reusable_editor/enums/file_data_source_type.dart';
import 'package:reusable_editor/reusable_editor.dart';
import 'package:reusable_editor/view_models/selection_cubit/selection_cubit.dart';
import 'package:reusable_editor/views/widgets/enum_option_drop_down_menu_form_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable Editor Example',
      home: const FileEditorDemo(),
    );
  }
}

class FileEditorDemo extends StatefulWidget {
  const FileEditorDemo({super.key});

  @override
  State<FileEditorDemo> createState() => _FileEditorDemoState();
}

class _FileEditorDemoState extends State<FileEditorDemo> {
  final SelectionCubit<FileDataSourceType> _sourceCubit = SelectionCubit();
  final ImageCrudCubit _imageCrudCubit = ImageCrudCubit();

  @override
  Widget build(BuildContext context) {
    final dropdownItems = [
      EnumOptionEntity(
        type: FileDataSourceType.fireStorage,
        icon: Icons.cloud,
        label: 'Firebase',
      ),
      EnumOptionEntity(
        type: FileDataSourceType.server,
        icon: Icons.storage,
        label: 'Server',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Reusable Editor Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            EnumOptionDropDownMenuFormField<FileDataSourceType>(
              selectedValue: _sourceCubit.state.selectedOption,
              onChanged: _sourceCubit.selectOption,
              hint: 'Choose data source',
              dropdownItems: dropdownItems,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final file = await 'assets/sample.png'.loadAsFile();
                _imageCrudCubit.selectImage(file);
              },
              child: const Text('Pick Image from Asset'),
            ),
            const SizedBox(height: 16),
            BlocBuilder<ImageCrudCubit, ImageCrudState>(
              bloc: _imageCrudCubit,
              builder: (context, state) {
                if (state.pickedFile != null) {
                  return Image.file(state.pickedFile!);
                }
                return const Text('No image selected');
              },
            ),
          ],
        ),
      ),
    );
  }
}
