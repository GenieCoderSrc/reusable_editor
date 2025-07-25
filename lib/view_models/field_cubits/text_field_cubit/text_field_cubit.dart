// file: text_field_cubit.dart
import 'package:flutter/widgets.dart';
import 'package:reusable_editor/view_models/field_cubits/field_cubit/field_cubit.dart';

// part 'text_field_state.dart';

class TextFieldCubit extends FieldCubit<String> {
  final TextEditingController controller = TextEditingController();

  TextFieldCubit({String? initialValue, super.validator})
    : super(initialValue: initialValue) {
    controller.text = initialValue ?? '';
    controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    // Keep Cubit state updated when user types
    final text = controller.text;
    if (text != state.value) {
      super.onChanged(text);
    }
  }

  @override
  void onChanged(String? value) {
    // Update Cubit + TextController together
    if (value != state.value) {
      controller.text = value ?? '';
      controller.selection = TextSelection.collapsed(
        offset: controller.text.length,
      );
    }
    super.onChanged(value);
  }

  void dispose() {
    controller.removeListener(_onTextChanged);
    controller.dispose();
  }
}

// class TextFieldCubit extends Cubit<TextFieldState> {
//   final IValidator<String> validator;
//
//   TextFieldCubit({IValidator<String>? validator})
//     : validator = validator ?? RequiredFieldValidator(),
//       super(const TextFieldState());
//
//   void onChanged(String? txt) {
//     debugPrint('TextFieldCubit | onChanged | txt: $txt');
//     final error = validator.validate(txt);
//     emit(state.copyWith(txt: txt, txtFieldError: error));
//   }
//
//   void clear() => emit(state.clear());
//
//   String? validate(String? txt) {
//     final error = validator.validate(txt ?? '');
//     emit(state.copyWith(txtFieldError: error));
//     return error;
//   }
// }
