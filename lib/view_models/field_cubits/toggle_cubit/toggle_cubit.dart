import 'package:reusable_editor/view_models/field_cubits/field_cubit/field_cubit.dart';

// ✅ Toggle Cubit (extends FieldCubit<bool>)
class ToggleCubit extends FieldCubit<bool> {
  ToggleCubit({bool super.initialValue = false, super.validator});

  void toggle() => onChanged(!(state.value ?? false));

  void enable() => onChanged(true);

  void disable() => onChanged(false);
}
