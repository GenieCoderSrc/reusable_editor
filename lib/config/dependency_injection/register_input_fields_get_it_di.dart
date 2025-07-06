import 'package:get_it_di_global_variable/get_it_di.dart';
import 'package:reusable_editor/reusable_editor.dart';

void registerInputFieldsGetItDI() {
  /// View Models
  sl.registerFactory(() => DateTimeCubit());
  sl.registerFactory(() => TextFieldCubit());
  sl.registerFactory(() => ImageCrudCubit());
  sl.registerFactory(() => SearchFieldCubit());
  sl.registerFactory(() => SwitchCubit());
  sl.registerFactory(() => ToggleCubit());
  sl.registerFactory(() => EnumOptionCubit());
}
