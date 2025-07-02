import 'package:reusable_editor/view_models/field_cubit/field_cubit.dart';

// ✅ Toggle Cubit (extends FieldCubit<bool>)
class ToggleCubit extends FieldCubit<bool> {
  ToggleCubit({bool super.initialValue = false, super.validator});

  void toggle() => update(!(state.value ?? false));

  void enable() => update(true);

  void disable() => update(false);
}
