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
      home: const FormEditorDemo(), // Renamed to better reflect form examples
    );
  }
}

class FormEditorDemo extends StatefulWidget {
  const FormEditorDemo({super.key});

  @override
  State<FormEditorDemo> createState() => _FormEditorDemoState();
}

class _FormEditorDemoState extends State<FormEditorDemo> {
  // Existing Cubits
  final EnumOptionCubit<FileDataSourceType> _sourceCubit = EnumOptionCubit();
  final ImageCrudCubit _imageCrudCubit = ImageCrudCubit();

  // New Cubits for the form fields
  final ToggleCubit _checkboxCubit = ToggleCubit(
    initialValue: true,
    validator: RequiredFieldValidator(), // Example validator
  );

  final FieldCubit<String> _textFieldCubit = FieldCubit<String>(
    initialValue: 'Hello World',
    validator: MinLengthValidator(3), // Example validator
  );
  final FieldCubit<DateTime> _datePickerCubit = FieldCubit<DateTime>(
    initialValue: DateTime.now(),
  );
  final FieldCubit<TimeOfDay> _timePickerCubit = FieldCubit<TimeOfDay>(
    initialValue: TimeOfDay.now(),
  );
  final FieldCubit<double> _sliderCubit = FieldCubit<double>(initialValue: 0.5);
  final FieldCubit<bool> _switchCubit = ToggleCubit(initialValue: false);

  @override
  void dispose() {
    _checkboxCubit.close();
    _textFieldCubit.close();
    _datePickerCubit.close();
    _timePickerCubit.close();
    _sliderCubit.close();
    _switchCubit.close();
    _sourceCubit.close();
    _imageCrudCubit.close();
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
        // Use SingleChildScrollView for scrollability
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Align widgets to the start
          children: [
            // Existing widgets
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
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            // New examples for form fields
            Text(
              'Form Field Examples',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // AppCheckbox Example
            AppCheckbox(
              cubit: _checkboxCubit,
              label: 'Accept Terms and Conditions',
            ),
            const SizedBox(height: 16),
            // Text field example
            AppTextField(
              cubit: _textFieldCubit,
              label: 'Enter your name',
              hintText: 'e.g., John Doe',
            ),
            const SizedBox(height: 16),
            // Date Picker Example
            AppDatePicker(
              cubit: _datePickerCubit,
              labelText: 'Select Date',
              placeholderText: 'Tap to pick a date',
              formatter: DateFormat('yyyy-MM-dd'),
            ),
            const SizedBox(height: 16),
            // Time Picker Example
            AppTimePicker(
              cubit: _timePickerCubit,
              labelText: 'Select Time',
              hintText: 'Tap to pick a time',
            ),
            const SizedBox(height: 16),
            // Slider Example
            AppSlider(
              cubit: _sliderCubit,
              min: 0.0,
              max: 1.0,
              divisions: 10,
              labelText: 'Select a value',
              displayValue:
                  (value) => value.toStringAsFixed(2), // Format for display
            ),
            const SizedBox(height: 16),
            // Switch Example
            AppSwitch(cubit: _switchCubit, label: 'Enable Feature'),
            const SizedBox(height: 16),

            // Example of a button to validate all fields (optional)
            ElevatedButton(
              onPressed: () {
                // You can call validate() on each cubit and check the result
                final isCheckboxValid = _checkboxCubit.validate() == null;
                final isTextFieldValid = _textFieldCubit.validate() == null;
                // ... and so on for other fields

                if (isCheckboxValid && isTextFieldValid) {
                  // Add other validations
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form is valid!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please correct errors in the form.'),
                    ),
                  );
                }
              },
              child: const Text('Validate All Fields'),
            ),
          ],
        ),
      ),
    );
  }
}
