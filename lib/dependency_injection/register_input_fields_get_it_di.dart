
import 'package:reusable_editor/view_models/image_field_cubit/image_field_cubit.dart';
import 'package:reusable_editor/view_models/selection_cubit/selection_cubit.dart';
import 'package:reusable_editor/view_models/switch_cubit/switch_cubit.dart';
import 'package:reusable_editor/view_models/text_field_cubit/text_field_cubit.dart';
 import 'package:reusable_app_bar/views/app_bars/reusable_app_bar.dart';
 import 'package:reusable_image_widget/reusable_image_widget.dart';
import 'package:get_it_di_global_variable/get_it_di.dart';


void registerInputFieldsGetItDI() {
  /// Use cases

  /// View Models
  sl.registerFactory(() => SearchFieldCubit());
  sl.registerFactory(() => TextFieldCubit());
  sl.registerFactory(() => ImageCrudCubit());
  sl.registerFactory(() => ImagePickerCubit());
  sl.registerFactory(() => SwitchCubit());
  sl.registerFactory(() => SelectionCubit());
}
