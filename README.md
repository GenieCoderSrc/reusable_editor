# reusable_editor

A flexible and modular file management package for Flutter, supporting both Firestore and REST API-based storage systems. This package includes file upload/delete operations, state management using Cubits, and various utilities for file/image handling and selection.

## Features
- Abstract interfaces for clean architecture
- File upload and delete operations
- Support for Firebase Firestore and custom REST API
- Cubits for managing form states (e.g. image, switch, dropdown, text field)
- Extensions for asset loading as `File` and `Uint8List`
- Enum-based dropdown with icon and label support

## Getting Started

### Installation
Add the following to your `pubspec.yaml`:
```yaml
dependencies:
  reusable_editor: ^0.0.4
```

### Import
```dart
import 'package:reusable_editor/reusable_editor.dart';
```

## Usage

### File Upload and Delete
```dart
final repository = FileRepositoryFireStorageDataSourceImpl(
  iFireStorageService: YourFireStorageService(),
);

final uploadUseCase = UploadFile(repository);
final deleteUseCase = DeleteFile(repository);

final result = await uploadUseCase.call(fileEntity);
```

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
- `DateTimeCubit` - Manages date selection
- `ImageCrudCubit` - Handles image pick logic and validation
- `SelectionCubit<T>` - Generic selection for enum dropdown
- `SwitchCubit` - Toggle logic
- `TextFieldCubit` - Text field validation

## Interfaces
- `IFileRepository` - Upload/Delete abstraction
- `IFileDiConst` - Dependency constant keys
- `IFileDiFactory` - Abstract DI factory

## Contributions
Feel free to open issues or pull requests.

## License
MIT License

