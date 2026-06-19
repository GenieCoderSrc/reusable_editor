import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'uploadable_field_state.dart';

abstract class UploadableFieldCubit<TState> extends Cubit<TState> {
  UploadableFieldCubit(super.initialState);
  double normalizeProgress(double progress) {
    return progress.clamp(0.0, 1.0);
  }

  bool shouldValidate({required bool force, required bool isDirty}) {
    return force || isDirty;
  }
}
