import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_validator/i_validator.dart';
import 'package:intl/intl.dart';
import 'package:reusable_editor/reusable_editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable Editor Example',
      home: const FormEditorDemo(),
    );
  }
}

class FormEditorDemo extends StatefulWidget {
  const FormEditorDemo({super.key});

  @override
  State<FormEditorDemo> createState() => _FormEditorDemoState();
}

class _FormEditorDemoState extends State<FormEditorDemo> {
  final EnumOptionCubit<FileDataSourceType> _sourceCubit = EnumOptionCubit();
  final ImageFieldCubit _imageCubit = ImageFieldCubit();

  final ToggleCubit _checkboxCubit = ToggleCubit(
    initialValue: false,
    validator: (val) => val == true ? null : 'You must accept the terms.',
  );

  final TextFieldCubit _textFieldCubit = TextFieldCubit(
    initialValue: '',
    validator: MinLengthValidator(3).call,
  );

  final FieldCubit<DateTime> _datePickerCubit = FieldCubit<DateTime>(
    validator: RequiredFieldValidator().call,
  );

  final FieldCubit<TimeOfDay> _timePickerCubit = FieldCubit<TimeOfDay>(
    validator: RequiredFieldValidator().call,
  );

  final FieldCubit<double> _sliderCubit = FieldCubit<double>(initialValue: 0.5);

  final ToggleCubit _switchCubit = ToggleCubit(
    initialValue: false,
    validator: (val) => val == true ? null : 'Feature must be enabled.',
  );

  @override
  void dispose() {
    _checkboxCubit.close();
    _textFieldCubit.close();
    _datePickerCubit.close();
    _timePickerCubit.close();
    _sliderCubit.close();
    _switchCubit.close();
    _sourceCubit.close();
    _imageCubit.close();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                final XFile? pickedFile = await 'assets/sample.png'
                    .loadAsXFile();
                if (pickedFile != null) {
                  _imageCubit.selectImage(pickedFile);

                }
              },
              child: const Text('Pick Image from Asset'),
            ),
            const SizedBox(height: 16),

            BlocBuilder<ImageFieldCubit, ImageFieldState>(
              bloc: _imageCubit,
              builder: (context, state) {
                final XFile? pickedFile = state.pickedFile;
                if (pickedFile != null) {
                  return Image.file(File(pickedFile.path));
                }
                return const Text('No image selected');
              },
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            Text(
              'Form Field Examples',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            AppCheckbox(
              cubit: _checkboxCubit,
              label: 'Accept Terms and Conditions',
            ),
            const SizedBox(height: 16),

            AppTextField(
              bloc: _textFieldCubit,
              label: 'Name',
              hintText: 'Enter your name',
            ),
            const SizedBox(height: 16),

            AppDatePicker(
              cubit: _datePickerCubit,
              labelText: 'Select Date',
              placeholderText: 'Tap to pick a date',
              formatter: DateFormat('yyyy-MM-dd'),
            ),
            const SizedBox(height: 16),

            AppTimePicker(
              cubit: _timePickerCubit,
              labelText: 'Select Time',
              hintText: 'Tap to pick a time',
            ),
            const SizedBox(height: 16),

            AppSlider(
              cubit: _sliderCubit,
              min: 0.0,
              max: 1.0,
              divisions: 10,
              labelText: 'Select a value',
              displayValue: (val) => val.toStringAsFixed(2),
            ),
            const SizedBox(height: 16),

            AppSwitch(cubit: _switchCubit, label: 'Enable Feature'),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _validateForm,
              child: const Text('Validate All Fields'),
            ),
          ],
        ),
      ),
    );
  }

  void _validateForm() {
    final isValid = [
      _checkboxCubit.validate(),
      _textFieldCubit.validate(),
      _datePickerCubit.validate(),
      _timePickerCubit.validate(),
      _switchCubit.validate(),
    ].every((error) => error == null);

    final message = isValid
        ? 'Form is valid!'
        : 'Please correct the highlighted errors.';

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
