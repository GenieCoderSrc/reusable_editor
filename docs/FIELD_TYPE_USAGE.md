[← Home](./index.md)

# 🧾 FIELD_TYPE_USAGE.md

This document provides examples of how to use `FieldCubit<T>` with different Dart data types in the `reusable_editor` package.

---

## ✅ FieldCubit<String> – Text (Required Input)

```dart
final nameFieldCubit = FieldCubit<String>(
  validator: RequiredStringValidator(),
);

nameFieldCubit.update('John Doe');
nameFieldCubit.validate(); // returns null if valid
```

## ✅ FieldCubit<int> – Integer (e.g., Age)

```dart
final ageFieldCubit = FieldCubit<int>(
  validator: MinValueValidator(min: 18),
);

ageFieldCubit.update(25);
ageFieldCubit.validate(); // ✅ returns null
```

## ✅ FieldCubit<double> – Floating point (e.g., Price)

```dart
final priceFieldCubit = FieldCubit<double>(
  validator: MinValueValidator(min: 0.0),
);

priceFieldCubit.update(99.99);
```

## ✅ FieldCubit<DateTime> – Date selection

```dart
final dateFieldCubit = FieldCubit<DateTime>(
  validator: RequiredDateValidator(),
);

dateFieldCubit.update(DateTime.now());
```

## ✅ FieldCubit<bool> – Toggle, Checkbox, etc.

```dart
final agreeFieldCubit = FieldCubit<bool>(
  validator: RequiredTrueValidator(), // Must be true
);

agreeFieldCubit.update(true); // ✅
```

## ✅ FieldCubit\<List<String>> – Multi-select

```dart
final tagsFieldCubit = FieldCubit<List<String>>(
  validator: RequiredListValidator(),
);

tagsFieldCubit.update(['flutter', 'dart']);
```

## ✅ FieldCubit<Enum> – Dropdown/select input

```dart
enum Gender { male, female, other }

final genderFieldCubit = FieldCubit<Gender>(
  validator: RequiredFieldValidator<Gender>(),
);

genderFieldCubit.update(Gender.male);
```

## ✅ UI Integration Example – Text Field

```dart
BlocBuilder<FieldCubit<String>, FieldState<String>>(
  bloc: nameFieldCubit,
  builder: (_, state) => TextFormField(
    initialValue: state.value ?? '',
    onChanged: nameFieldCubit.update,
    decoration: InputDecoration(
      labelText: 'Name',
      errorText: state.errorText,
    ),
  ),
);
```
