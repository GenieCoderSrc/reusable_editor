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

## ✅ ImageCrudCubit

Cubit to handle image picking, uploading, and validation.

```dart
final imageCubit = ImageCrudCubit();

await imageCubit.pickImage();
```

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
