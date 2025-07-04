# reusable_editor

A flexible and modular file management and form handling package for Flutter, supporting both Firestore and REST API-based storage systems along with comprehensive form field management. This package includes file operations, form state management using Cubits, and a collection of reusable form field widgets.

## Features

* Abstract interfaces for clean architecture
* Cubits for managing form states (e.g., image, switch, dropdown, text field)
* Complete set of reusable form field widgets
* Extensions for asset loading as `File` and `Uint8List`
* Enum-based dropdown with icon and label support

## Getting Started

### Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  reusable_editor: <latest_version>
```

### Import

```dart
import 'package:reusable_editor/reusable_editor.dart';
```

## 📘 Documentation

Full usage guides available at:
👉 [https://geniecodersrc.github.io/reusable_editor](https://geniecodersrc.github.io/reusable_editor/)

## Usage

### Form Field Management

```dart
// Create cubit for a field
final textFieldCubit = FieldCubit<String>(
  initialValue: 'Default',
  validator: RequiredValidator(),
);

// Use with AppTextField
AppTextField(cubit: textFieldCubit);

// Toggle field example
final toggleCubit = ToggleCubit(initialValue: false);
AppSwitch(cubit: toggleCubit);
```

### Available Form Widgets

* `AppCheckbox` - Checkbox with label and validation
* `AppDatePicker` - Date selection field
* `AppDropdown` - Custom dropdown field
* `AppFilePicker` - File selection widget
* `AppRadioGroup` - Radio button group
* `AppRangeSlider` - Range slider input
* `AppSlider` - Slider input
* `AppSwitch` - Toggle switch
* `AppTextField` - Text input field
* `AppTimePicker` - Time selection field

### Dropdown with Enum

```dart
enum FileSourceType { firebase, server }

final dropdown = EnumOptionDropDownMenuFormField<FileSourceType>(
  selectedValue: selectedOption,
  onChanged: (value) => print(value?.type),
  hint: 'Select file source',
  dropdownItems: [
    EnumOptionEntity(type: FileSourceType.firebase, icon: Icons.cloud, label: 'Firebase'),
    EnumOptionEntity(type: FileSourceType.server, icon: Icons.storage, label: 'Server'),
  ],
);
```

### Load Asset as File

```dart
final file = await 'assets/image.png'.loadAsFile();
```

### Load Asset as Bytes

```dart
final bytes = await 'assets/image.png'.loadAssetImage();
```

## State Management Cubits

* `FieldCubit<T>` - Generic form field management with validation
* `ToggleCubit` - Specialized cubit for boolean toggle fields
* `DateTimeCubit` - Manages date selection
* `ImageCrudCubit` - Handles image pick logic and validation
* `EnumOptionCubit<T>` - Dropdown Selection with Generic enum 
* `SwitchCubit` - Toggle logic
* `TextFieldCubit` - Text field validation

## Contributions

Feel free to open issues or pull requests.

## License

© MIT License. Developed with ❤️ by [Shohidul Islam](https://github.com/ShohidulProgrammer)
