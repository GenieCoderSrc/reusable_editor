import 'package:get_it_di_global_variable/get_it_di.dart';
import 'package:reusable_app_bar/views/app_bars/reusable_app_bar.dart';
import 'package:reusable_editor/reusable_editor.dart';
import 'package:reusable_editor/view_models/date_time_cubit/date_time_cubit.dart';
import 'package:reusable_editor/view_models/image_field_cubit/image_field_cubit.dart';
import 'package:reusable_editor/view_models/selection_cubit/enum_option_cubit.dart';
import 'package:reusable_editor/view_models/switch_cubit/switch_cubit.dart';
import 'package:reusable_editor/view_models/text_field_cubit/text_field_cubit.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

void registerInputFieldsGetItDI() {
  /// View Models
  sl.registerFactory(() => DateTimeCubit());
  sl.registerFactory(() => TextFieldCubit());
  sl.registerFactory(() => ImageCrudCubit());
  sl.registerFactory(() => ImagePickerCubit());
  sl.registerFactory(() => SearchFieldCubit());
  sl.registerFactory(() => SwitchCubit());
  sl.registerFactory(() => ToggleCubit());
  sl.registerFactory(() => EnumOptionCubit());
}
