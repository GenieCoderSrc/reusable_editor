import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_di_global_variable/get_it_di.dart';
import 'package:provider/single_child_widget.dart';
import 'package:reusable_editor/reusable_editor.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

// ---- Reusable Editor ------

late TextFieldCubit _textFieldCubit;
late DateTimeCubit _dateTimeCubit;
late ImageCrudCubit _imageCrudCubit;
late ImagePickerCubit _imagePickerCubit;
late SearchFieldCubit _searchFieldCubit;
late SwitchCubit _switchCubit;
late EnumOptionCubit _selectionCubit;
late ToggleCubit _toggleCubit;

initReusableEditorBlocProvider() {
  // ---- Reusable Editor Init ------
  _textFieldCubit = sl<TextFieldCubit>();
  _dateTimeCubit = sl<DateTimeCubit>();
  _imageCrudCubit = sl<ImageCrudCubit>();
  _imagePickerCubit = sl<ImagePickerCubit>();
  _searchFieldCubit = sl<SearchFieldCubit>();
  _switchCubit = sl<SwitchCubit>();
  _selectionCubit = sl<EnumOptionCubit>();
  _toggleCubit = sl<ToggleCubit>();
}

disposeReusableEditorBlocProvider() {
  // ---- Reusable Editor Dispose ------
  _textFieldCubit.close();
  _dateTimeCubit.close();
  _imageCrudCubit.close();
  _imagePickerCubit.close();
  _searchFieldCubit.close();
  _switchCubit.close();
  _selectionCubit.close();
  _toggleCubit.close();
}

List<SingleChildWidget> reusableEditorBlocProviders = [
  // ---- Reusable Editor Bloc Provider ------
  BlocProvider<TextFieldCubit>(create: (_) => _textFieldCubit),
  BlocProvider<DateTimeCubit>(create: (_) => _dateTimeCubit),
  BlocProvider<ImageCrudCubit>(create: (_) => _imageCrudCubit),
  BlocProvider<ImagePickerCubit>(create: (_) => _imagePickerCubit),
  BlocProvider<SearchFieldCubit>(create: (_) => _searchFieldCubit),
  BlocProvider<SwitchCubit>(create: (_) => _switchCubit),
  BlocProvider<EnumOptionCubit>(create: (_) => _selectionCubit),
  BlocProvider<ToggleCubit>(create: (_) => _toggleCubit),
];
