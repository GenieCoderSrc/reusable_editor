[← Home](./index.md)

# 📙 CUBIT_USAGE.md

This document provides examples of how to use various Cubits available in the `reusable_editor` package.

---

## ✅ FieldCubit<T>

Generic Cubit for managing form fields with validation.

```dart
final nameCubit = FieldCubit<String>(
  initialValue: 'Default Name',
  validator: RequiredStringValidator(),
);

nameCubit.update('John Doe');
final error = nameCubit.validate(); // returns null if valid
```

## ✅ ToggleCubit

Specialized Cubit for boolean toggle fields.

```dart
final toggleCubit = ToggleCubit(initialValue: false);

toggleCubit.update(true);
```

## ✅ DateTimeCubit

Cubit for managing date selection.

```dart
final dateCubit = DateTimeCubit(initialValue: DateTime.now());

dateCubit.update(DateTime(2025, 7, 1));
```

## ✅ Uploadable Field Cubits

These Cubits provide a structured way to handle file uploads, deletions, and progress tracking for different file types. They all extend a common base to ensure consistency.

### ImageFieldCubit
Handles single image selection and validation.
```dart
final imageCubit = ImageFieldCubit();
imageCubit.selectImage(xFile);
```

### ListImageFieldCubit
Handles multiple image selections and aggregate tracking.
```dart
final listImageCubit = ListImageFieldCubit();
listImageCubit.selectImages([xFile1, xFile2]);
```

### AudioFieldCubit
Handles audio file selection and upload lifecycle.
```dart
final audioCubit = AudioFieldCubit();
audioCubit.selectAudio(xFile);
audioCubit.startUpload();
audioCubit.updateUploadProgress(0.5);
audioCubit.finishUpload('https://example.com/audio.mp3');
```

### VideoFieldCubit
Handles video file selection and upload lifecycle.
```dart
final videoCubit = VideoFieldCubit();
videoCubit.selectVideo(xFile);
videoCubit.startUpload();
videoCubit.finishUpload('https://example.com/video.mp4');
```

### DocFieldCubit
Handles document file selection and upload lifecycle.
```dart
final docCubit = DocFieldCubit();
docCubit.selectDoc(xFile);
docCubit.startUpload();
docCubit.finishUpload('https://example.com/doc.pdf');
```

**Common Uploadable Methods:**
- `startUpload()`: Sets `isUploading` to true.
- `updateUploadProgress(double)`: Updates the progress percentage.
- `finishUpload(String url)`: Completes upload and saves the remote URL.
- `failUpload(String error)`: Handles upload errors.
- `startDelete()` / `finishDelete()`: Manages the deletion lifecycle.
- `validate()`: Validates the picked file against the specific file type.


## ✅ SelectionCubit<T>

Generic selection Cubit for enum or any type of selection.

```dart
enum Gender { male, female, other }

final genderSelectionCubit = SelectionCubit<Gender>(initialValue: Gender.male);

genderSelectionCubit.update(Gender.female);
```

## ✅ SwitchCubit

Cubit to manage simple boolean switch state.

```dart
final switchCubit = SwitchCubit(initialValue: false);

switchCubit.update(true);
```

## ✅ TextFieldCubit

Cubit specialized for text field validation and management.

```dart
final textFieldCubit = TextFieldCubit(
  initialValue: '',
  validator: RequiredStringValidator(),
);

textFieldCubit.update('Hello World');
```
