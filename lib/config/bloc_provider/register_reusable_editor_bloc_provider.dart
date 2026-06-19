import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_di_global_variable/get_it_di.dart';
import 'package:provider/single_child_widget.dart';
import 'package:reusable_editor/reusable_editor.dart';

// ---- Reusable Editor ------

late TextFieldCubit _textFieldCubit;
late DateTimeCubit _dateTimeCubit;
late SwitchCubit _switchCubit;
late EnumOptionCubit _selectionCubit;
late ToggleCubit _toggleCubit;
late VideoFieldCubit _videoFieldCubit;
late AudioFieldCubit _audioFieldCubit;
late DocFieldCubit _docFieldCubit;
late ImageFieldCubit _imageFieldCubit;
late ListImageFieldCubit _listImageFieldCubit;
// late SearchFieldCubit _searchFieldCubit;

initReusableEditorBlocProvider() {
  // ---- Reusable Editor Init ------
  _textFieldCubit = sl<TextFieldCubit>();
  _dateTimeCubit = sl<DateTimeCubit>();
  _switchCubit = sl<SwitchCubit>();
  _selectionCubit = sl<EnumOptionCubit>();
  _toggleCubit = sl<ToggleCubit>();
  _videoFieldCubit = sl<VideoFieldCubit>();
  _audioFieldCubit = sl<AudioFieldCubit>();
  _docFieldCubit = sl<DocFieldCubit>();
  _imageFieldCubit = sl<ImageFieldCubit>();
  _listImageFieldCubit = sl<ListImageFieldCubit>();
  // _searchFieldCubit = sl<SearchFieldCubit>();
}

disposeReusableEditorBlocProvider() {
  // ---- Reusable Editor Dispose ------
  _textFieldCubit.close();
  _dateTimeCubit.close();
  _switchCubit.close();
  _selectionCubit.close();
  _toggleCubit.close();
  _videoFieldCubit.close();
  _audioFieldCubit.close();
  _docFieldCubit.close();
  _imageFieldCubit.close();
  _listImageFieldCubit.close();
  // _searchFieldCubit.close();
}

List<SingleChildWidget> reusableEditorBlocProviders = [
  // ---- Reusable Editor Bloc Provider ------
  BlocProvider<TextFieldCubit>(create: (_) => _textFieldCubit),
  BlocProvider<DateTimeCubit>(create: (_) => _dateTimeCubit),
  BlocProvider<SwitchCubit>(create: (_) => _switchCubit),
  BlocProvider<EnumOptionCubit>(create: (_) => _selectionCubit),
  BlocProvider<ToggleCubit>(create: (_) => _toggleCubit),
  BlocProvider<VideoFieldCubit>(create: (_) => _videoFieldCubit),
  BlocProvider<AudioFieldCubit>(create: (_) => _audioFieldCubit),
  BlocProvider<DocFieldCubit>(create: (_) => _docFieldCubit),
  BlocProvider<ImageFieldCubit>(create: (_) => _imageFieldCubit),
  BlocProvider<ListImageFieldCubit>(create: (_) => _listImageFieldCubit),
  // BlocProvider<SearchFieldCubit>(create: (_) => _searchFieldCubit),
];
