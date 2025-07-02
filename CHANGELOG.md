# Changelog

All notable changes to this project will be documented in this file.


### **Version 1.0.0** (Jul 3, 2025)

### 🆕 Added

* **New Input Widgets using ********`FieldCubit<T>`******** (renamed to App-prefixed)**

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
* Input decoration elements follow `InputDecorationStyles` for consistent field UI (e.g., border, padding, label styles)

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
