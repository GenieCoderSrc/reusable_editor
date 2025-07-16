import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_di_global_variable/get_it_di.dart';
import 'package:provider/single_child_widget.dart';
import 'package:reusable_editor/reusable_editor.dart';

// ---- Reusable Editor ------

late TextFieldCubit _textFieldCubit;
late DateTimeCubit _dateTimeCubit;
late ImageFieldCubit _imageCrudCubit;
late SwitchCubit _switchCubit;
late EnumOptionCubit _selectionCubit;
late ToggleCubit _toggleCubit;
// late SearchFieldCubit _searchFieldCubit;

initReusableEditorBlocProvider() {
  // ---- Reusable Editor Init ------
  _textFieldCubit = sl<TextFieldCubit>();
  _dateTimeCubit = sl<DateTimeCubit>();
  _imageCrudCubit = sl<ImageFieldCubit>();
  _switchCubit = sl<SwitchCubit>();
  _selectionCubit = sl<EnumOptionCubit>();
  _toggleCubit = sl<ToggleCubit>();
  // _searchFieldCubit = sl<SearchFieldCubit>();
}

disposeReusableEditorBlocProvider() {
  // ---- Reusable Editor Dispose ------
  _textFieldCubit.close();
  _dateTimeCubit.close();
  _imageCrudCubit.close();
  _switchCubit.close();
  _selectionCubit.close();
  _toggleCubit.close();
  // _searchFieldCubit.close();
}

List<SingleChildWidget> reusableEditorBlocProviders = [
  // ---- Reusable Editor Bloc Provider ------
  BlocProvider<TextFieldCubit>(create: (_) => _textFieldCubit),
  BlocProvider<DateTimeCubit>(create: (_) => _dateTimeCubit),
  BlocProvider<ImageFieldCubit>(create: (_) => _imageCrudCubit),
  BlocProvider<SwitchCubit>(create: (_) => _switchCubit),
  BlocProvider<EnumOptionCubit>(create: (_) => _selectionCubit),
  BlocProvider<ToggleCubit>(create: (_) => _toggleCubit),
  // BlocProvider<SearchFieldCubit>(create: (_) => _searchFieldCubit),
];
