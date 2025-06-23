import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_di_global_variable/get_it_di.dart';
import 'package:provider/single_child_widget.dart';
import 'package:reusable_app_bar/view_models/search_field_cubit.dart';
import 'package:reusable_editor/view_models/image_field_cubit/image_field_cubit.dart';
import 'package:reusable_editor/view_models/selection_cubit/selection_cubit.dart';
import 'package:reusable_editor/view_models/switch_cubit/switch_cubit.dart';
import 'package:reusable_editor/view_models/text_field_cubit/text_field_cubit.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

// ---- Reusable Editor ------

late TextFieldCubit _textFieldCubit;
late ImageCrudCubit _imageCrudCubit;
late ImagePickerCubit _imagePickerCubit;
late SearchFieldCubit _searchFieldCubit;
late SwitchCubit _switchCubit;
late SelectionCubit _selectionCubit;

initReusableEditorBlocProvider() {
  // ---- Reusable Editor Init ------
  _textFieldCubit = sl<TextFieldCubit>();
  _imageCrudCubit = sl<ImageCrudCubit>();
  _imagePickerCubit = sl<ImagePickerCubit>();
  _searchFieldCubit = sl<SearchFieldCubit>();
  _switchCubit = sl<SwitchCubit>();
  _selectionCubit = sl<SelectionCubit>();
}

disposeReusableEditorBlocProvider() {
  // ---- Reusable Editor Dispose ------
  _textFieldCubit.close();
  _imageCrudCubit.close();
  _imagePickerCubit.close();
  _searchFieldCubit.close();
  _switchCubit.close();
  _selectionCubit.close();
}

List<SingleChildWidget> reusableEditorBlocProviders = [
  // ---- Reusable Editor Bloc Provider ------
  BlocProvider<TextFieldCubit>(
    create: (BuildContext context) => _textFieldCubit,
  ),
  BlocProvider<ImageCrudCubit>(
    create: (BuildContext context) => _imageCrudCubit,
  ),
  BlocProvider<ImagePickerCubit>(
    create: (BuildContext context) => _imagePickerCubit,
  ),
  BlocProvider<SearchFieldCubit>(
    create: (BuildContext context) => _searchFieldCubit,
  ),
  BlocProvider<SwitchCubit>(create: (BuildContext context) => _switchCubit),
  BlocProvider<SelectionCubit>(
    create: (BuildContext context) => _selectionCubit,
  ),
];
