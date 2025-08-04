# Changelog

All notable changes to this project will be documented in this file.

## 1.1.8

### Aug 5, 2025

### ♻️ Refactored

* Uses `TextFieldCubit` in the `AppTextField`, for state management.
* Added optional variables `builder` in the `AppTextField`, to pass custom input field widget.
* Added Border & fill config variables in the `AppTextField`, for text field customization.

## 1.1.7

### July 27, 2025

### ♻️ Updated

* Added `failDelete` in the `ImageFieldCubit` to improved delete state management and user feedback.

## 1.1.6

### July 27, 2025

### ♻️ Updated

* Added `failUpload` in the `ImageFieldCubit` to improved upload state management and user feedback.

## 1.1.5

### July 26, 2025

### ♻️ Updated

* Improved `ImageFieldCubit` to support upload and delete state management.
* Added `uploadProgress`, `isUploading`, and `isDeleting` to `ImageFieldState` for improved image operation tracking and
  user feedback in forms.

## 1.1.4

### July 26, 2025

**➕ Created**

- Usages `ImageFieldState` in the `ImageFieldCubit`.

* `base_bloc.dart`: Introduced a foundational abstract class for all BLoCs. This class enforces the use of a common
  state that extends `BaseState`, encouraging consistency and reusability across all business logic components.

* `base_state.dart`: Defined an abstract base state that all Cubit or Bloc states should extend. It encapsulates a
  `FormSubmissionStatus` to track form states (e.g., loading, success, failure), aligning with the Single Responsibility
  Principle.

* `form_submission_status.dart`: Added sealed classes to represent the different statuses of form submission: initial,
  submitting, success, and failed. These classes ensure clear and maintainable handling of form-related logic, and
  provide extensibility for future states.

* `loading_cubit.dart`: Implemented a dedicated `Cubit` to manage general-purpose loading states across the app. This
  promotes separation of concerns by delegating loading logic to its own class.

* `loading_state.dart`: Introduced a strongly-typed state system for `LoadingCubit`, including `LoadingInitial`,
  `LoadingInProgress`, and `LoadingError`. This supports more expressive and testable UI loading feedback.

These additions were created following SOLID principles and ensure a clean architecture approach for scalable and
maintainable Flutter applications.

## 1.1.3

### July 23, 2025

♻️ Updated

- Usages `ImageFieldState` in the `ImageFieldCubit`.

## 1.1.2

### July 22, 2025

♻️ Updated

- Added `selectImage` method in the `ImageFieldCubit`.

## 1.1.1

### July 22, 2025

♻️ Refactored

- Renamed  `update` to `onChanged` in the `FieldCubit<T>`.

## 1.1.0

### July 22, 2025

♻️ Refactored

- Added `formFieldValidator` getter to `FieldCubit<T>` to provide a reusable Flutter form validator callback without
  duplicating validation logic.

## 1.0.9

### July 22, 2025

### ✅ Added

- `String?.loadAsXFile()` for converting asset paths to `XFile`

### ✅ Refactored

* `SwitchCubit` has been completely replaced by `ToggleCubit`, which extends `FieldCubit<bool>`.
    * Offers cleaner implementation using `.toggle()`, `.enable()`, `.disable()`.
    * Leverages `FieldCubit` validation and reset mechanics.
    * More reusable and aligns with all other form field cubits.

### ✨ Enhanced

* Updated example usage in `main.dart` to demonstrate:
    * Modern `ToggleCubit` instead of `SwitchCubit`.
    * Unified form field cubit usage.
    * `validate()` pattern on all `FieldCubit<T>` instances.
    * Usage of `EnumOptionDropDownMenuFormField`, `AppCheckbox`, `AppTextField`, `AppDatePicker`, etc.

## 1.0.8

### Jul 16, 2025

### 🐞 Fixed

* Fixed clear() method behavior in various Cubits to properly emit cleared state using emit().

## 1.0.7

### Jul 16, 2025

### 🐞 Fixed

* fixed Angle brackets will be interpreted as HTML for `AppDatePicker` and `AppSlider`.

## 1.0.6

### Jul 16, 2025

### ✨ Enhanced

* Introduced `FieldCubit<T>` and `FieldState<T>`:

    * Generic, reusable Cubit for form input fields.
    * Tracks current value and error message.
    * Includes `.update(value)`, `.clear()`, and `.reset()` methods.

### ✅ Refactored

* `DateTimeCubit`, `TextFieldCubit`, and `SwitchCubit` updated to:

    * Respect user-provided initial values.
    * Improved state updates and structure.
    * Used common structure aligning with `FieldCubit<T>`.

---

## 1.0.5

### Jul 6, 2025

### 🧹 Refactored

* **Removed `ImagePickerCubit`** registration and BlocProvider setup from `reusable_editor`.
* **Decoupled image picking functionality**:
    * `reusable_editor` no longer handles or depends on image picking, cropping, or compressing logic.
    * All related logic has been moved to the independent package `reusable_image_widget`.

### 🔄 Migration Note

If you were using `ImagePickerCubit` or image-related widgets in `reusable_editor`, you must now:

- Add the `reusable_image_widget` package to your project.
- Register its dependencies using `registerReusableImageWidgetDependencies()`.
- Include `ImagePickerCubit` in your widget tree using `reusableImageWidgetBlocProviders`.

✅ This makes `reusable_editor` cleaner, more modular, and focused strictly on form field editors and reusable input
Cubits.

## 1.0.4

### Jul 4, 2025

### 📘 Updated

* Updated **GitHub Pages**-based documentation under the `doc/` folder:
    * Setup widget usage examples files
    * Setup package Libraries linking with `API Reference`
    * `API Reference` – Full Dart API docs generated by dartdoc

---

## 1.0.3

### Jul 3, 2025

### 📘 Removed

    * `VALIDATOR_USAGE.md` – Guide for using built-in and custom validators.
    * Separated in the `i_validator` package for built-in and custom validators.

---

## 1.0.2

### Jul 3, 2025

### 📘 Documentation

* Added **GitHub Pages**-based documentation under the `doc/` folder:

    * `VALIDATOR_USAGE.md` – Guide for using built-in and custom validators.

---

## 1.0.1

### Jul 3, 2025

### 📘 Documentation

* Added **GitHub Pages**-based documentation under the `doc/` folder:

    * `WIDGET_USAGE.md` – widget usage examples
    * `CUBIT_USAGE.md` – usage of FieldCubit, ToggleCubit, etc.
    * `FIELD_TYPE_USAGE.md` – usage patterns for `FieldCubit<T>` with various types
    * Setup `index.md` as the documentation landing page
    * Linked documentation from README

---

## 1.0.0

### Jul 3, 2025

### 🆕 Added

* **New Input Widgets using** `FieldCubit<T>` **(renamed to App-prefixed)**

    * `AppTextField` – for text input with validation
    * `AppCheckbox` – checkbox input with error text
    * `AppDropdown<T>` – generic dropdown field
    * `AppSwitch` – switch toggle input
    * `AppRadioGroup<T>` – radio button group input
    * `AppSlider` – numeric slider input
    * `AppRangeSlider` – range slider input with min/max
    * `AppDatePicker` – date picker field
    * `AppTimePicker` – time picker field
    * `AppFilePicker` – file picker using `file_picker` package

### ✅ Renamed

* `selection_cubit.dart` ➔ `enum_option_cubit.dart`
* `selection_state.dart` ➔ `enum_option_state.dart`

### 🧱 Cubits

* `ToggleCubit` added for boolean toggle handling using `FieldCubit<bool>`
* `FieldCubit<T>` added as a generic form state cubit with validation support

### 🎨 Styles

* Text field and error styles use centralized `AppFormTextStyles`
* Input decoration elements follow `InputDecorationStyles` for consistent field UI (e.g., border,
  padding, label styles)

---

## 0.0.6+2

* Export Bloc Provider.
* Export GetIt DI.

## 0.0.6+1

* Added DateTimeCubit Bloc Provider.
* Registered DateTimeCubit GetIt DI.

## 0.0.6

* Implemented Bloc Provider.
* Implemented GetIt DI.
* Removed fileRegisterGetItDiRestApiDataSource.

## 0.0.5

* Added fileRegisterGetItDiRestApiDataSource,

## 0.0.4

* Added Register Input Field Get It Di,

## 0.0.3

### Updated

* Refactored SwitchCubit:

    * Now uses a typed SwitchState model instead of a raw bool.
    * Introduced debug logging in onChanged and clearSwitch for easier tracing.
    * Improved structure following SOLID principles.

* Added

    * clearSwitch() method to SwitchCubit for resetting the switch state to default (true).

## 0.0.2

### Added

* Support for uploading and deleting files via Firestore or REST API.
* `FileEntity` and `FileResponseEntity` models.
* Enum-based dropdown form field (`EnumOptionDropDownMenuFormField`).
* Cubits for managing UI state:

    * `DateTimeCubit`
    * `ImageCrudCubit`
    * `SelectionCubit`
    * `SwitchCubit`
    * `TextFieldCubit`
* Utility extensions:

    * `String?.loadAsFile()` for converting asset paths to `File`
    * `String.loadAssetImage()` for loading images as bytes
* Abstract interfaces for file handling and dependency constants.
* Example usage with a mock implementation of `IFireStorageService`.

## 0.0.1

* Initial release of `reusable_editor` package.



