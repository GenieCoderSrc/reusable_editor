# Changelog

All notable changes to this project will be documented in this file.



## 0.0.6+1
- Added DateTimeCubit Bloc Provider.
- Registered DateTimeCubit GetIt DI.


## 0.0.6
- Implemented Bloc Provider.
- Implemented GetIt DI.
- Removed fileRegisterGetItDiRestApiDataSource.


## 0.0.5
- Added fileRegisterGetItDiRestApiDataSource,


## 0.0.4
- Added Register Input Field Get It Di,


## 0.0.3
### Updated
- Refactored SwitchCubit:
  - Now uses a typed SwitchState model instead of a raw bool.
  - Introduced debug logging in onChanged and clearSwitch for easier tracing.
  - Improved structure following SOLID principles.

- Added
  - clearSwitch() method to SwitchCubit for resetting the switch state to default (true).


## 0.0.2
### Added
- Support for uploading and deleting files via Firestore or REST API.
- `FileEntity` and `FileResponseEntity` models.
- Enum-based dropdown form field (`EnumOptionDropDownMenuFormField`).
- Cubits for managing UI state:
    - `DateTimeCubit`
    - `ImageCrudCubit`
    - `SelectionCubit`
    - `SwitchCubit`
    - `TextFieldCubit`
- Utility extensions:
    - `String?.loadAsFile()` for converting asset paths to `File`
    - `String.loadAssetImage()` for loading images as bytes
- Abstract interfaces for file handling and dependency constants.
- Example usage with a mock implementation of `IFireStorageService`.


## 0.0.1
- Initial release of `reusable_editor` package.
