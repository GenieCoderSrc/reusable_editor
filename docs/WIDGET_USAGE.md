[← Home](./index.md)

# 📘 WIDGET_USAGE.md

This document provides examples of how to use the available form widgets provided by the `reusable_editor` package.

---

## ✅ AppCheckbox – Checkbox with label and validation

```dart
final agreeCubit = FieldCubit<bool>(validator: RequiredTrueValidator());
AppCheckbox(cubit: agreeCubit, label: 'Agree to Terms');
```

## ✅ AppDatePicker – Date selection field

```dart
final dateCubit = FieldCubit<DateTime>(validator: RequiredDateValidator());
AppDatePicker(cubit: dateCubit);
```

## ✅ AppDropdown – Custom dropdown field

```dart
enum Status { active, inactive }
final statusCubit = FieldCubit<Status>(validator: RequiredFieldValidator<Status>());
AppDropdown<Status>(cubit: statusCubit, items: Status.values);
```

## ✅ AppFilePicker – File selection widget

```dart
final fileCubit = FieldCubit<File>(validator: RequiredFieldValidator<File>());
AppFilePicker(cubit: fileCubit);
```

## ✅ AppRadioGroup – Radio button group

```dart
final genderCubit = FieldCubit<String>(validator: RequiredStringValidator());
AppRadioGroup<String>(cubit: genderCubit, options: ['Male', 'Female']);
```

## ✅ AppRangeSlider – Range slider input

```dart
final rangeCubit = FieldCubit<RangeValues>();
AppRangeSlider(cubit: rangeCubit, min: 0, max: 100);
```

## ✅ AppSlider – Slider input

```dart
final volumeCubit = FieldCubit<double>(initialValue: 50);
AppSlider(cubit: volumeCubit, min: 0, max: 100);
```

## ✅ AppSwitch – Toggle switch

```dart
final toggleCubit = ToggleCubit(initialValue: false);
AppSwitch(cubit: toggleCubit);
```

## ✅ AppTextField – Text input field

```dart
final nameCubit = FieldCubit<String>(validator: RequiredStringValidator());
AppTextField(cubit: nameCubit);
```

## ✅ AppTimePicker – Time selection field

```dart
final timeCubit = FieldCubit<TimeOfDay>(validator: RequiredFieldValidator<TimeOfDay>());
AppTimePicker(cubit: timeCubit);
```
