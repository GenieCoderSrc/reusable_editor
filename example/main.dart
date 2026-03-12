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

/// Define a sample Enum for the multi-select demo
enum UserRole { admin, editor, viewer, guest }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Reusable Editor Example',
      home: FormEditorDemo(),
    );
  }
}

class FormEditorDemo extends StatefulWidget {
  const FormEditorDemo({super.key});

  @override
  State<FormEditorDemo> createState() => _FormEditorDemoState();
}

class _FormEditorDemoState extends State<FormEditorDemo> {
  /// --- Cubit Instances ---

  final EnumOptionCubit<FileDataSourceType> _sourceCubit = EnumOptionCubit();

  /// Multi-select Cubit
  late final MultiEnumOptionCubit<UserRole> _rolesCubit;

  final FieldCubit<String> _genderCubit = FieldCubit<String>(
    initialValue: 'Male',
    validator: RequiredFieldValidator().call,
  );

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
  void initState() {
    super.initState();

    /// MultiEnumOptionCubit no longer needs options
    _rolesCubit = MultiEnumOptionCubit<UserRole>();
  }

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
    _rolesCubit.close();
    _genderCubit.close();
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

    final roleOptions = [
      EnumOptionEntity(
        type: UserRole.admin,
        label: 'Administrator',
        icon: Icons.security,
      ),
      EnumOptionEntity(
        type: UserRole.editor,
        label: 'Content Editor',
        icon: Icons.edit,
      ),
      EnumOptionEntity(
        type: UserRole.viewer,
        label: 'Viewer Only',
        icon: Icons.visibility,
      ),
      EnumOptionEntity(
        type: UserRole.guest,
        label: 'Guest',
        icon: Icons.person_outline,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Reusable Editor Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Single Selection (Dropdown)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),

            EnumOptionDropDownMenuFormField<FileDataSourceType>(
              selectedValue: _sourceCubit.state.selectedOption,
              onChanged: _sourceCubit.selectOption,
              hint: 'Choose data source',
              dropdownItems: dropdownItems,
            ),

            const SizedBox(height: 24),

            Text(
              'Multi-Selection (Checkboxes)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: EnumMultiOptionCheckboxGroup<UserRole>(
                  cubit: _rolesCubit,
                  options: roleOptions,
                  label: 'User Roles',
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Image Picker',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),

            ElevatedButton.icon(
              onPressed: () async {
                final XFile? pickedFile = await 'assets/sample.png'
                    .loadAsXFile();
                if (pickedFile != null) {
                  _imageCubit.selectImage(pickedFile);
                }
              },
              icon: const Icon(Icons.image),
              label: const Text('Simulate Image Pick'),
            ),

            const SizedBox(height: 16),

            BlocBuilder<ImageFieldCubit, ImageFieldState>(
              bloc: _imageCubit,
              builder: (context, state) {
                final XFile? pickedFile = state.pickedFile;

                if (pickedFile != null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(File(pickedFile.path), height: 100),
                  );
                }

                return const Text('No image selected');
              },
            ),

            const Divider(height: 40),

            Text(
              'Standard Form Fields',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 16),

            AppRadioGroup<String>(
              cubit: _genderCubit,
              label: 'Select Gender',
              values: const ['Male', 'Female', 'Other'],
              labels: const ['Male', 'Female', 'Other'],
              activeColor: Colors.deepPurple,
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
              labelText: 'Intensity Level',
              displayValue: (val) => '${(val * 100).toInt()}%',
            ),

            const SizedBox(height: 16),

            AppSwitch(cubit: _switchCubit, label: 'Enable Notifications'),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _validateForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text('Validate & Submit'),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _validateForm() {
    final isValid = [
      _genderCubit.validate(),
      _checkboxCubit.validate(),
      _textFieldCubit.validate(),
      _datePickerCubit.validate(),
      _timePickerCubit.validate(),
      _switchCubit.validate(),
    ].every((error) => error == null);

    final selectedRoles = _rolesCubit.selectedTypes
        .map((e) => e.name)
        .join(', ');

    final message = isValid
        ? 'Valid! Gender: ${_genderCubit.state.value}, Roles: ${selectedRoles.isEmpty ? 'None' : selectedRoles}'
        : 'Please correct the highlighted errors.';

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
