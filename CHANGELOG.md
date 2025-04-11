# Changelog

All notable changes to this project will be documented in this file.


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
