import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i_validator/i_validator.dart';

part 'date_time_state.dart';

class DateTimeCubit extends Cubit<DateTimeState> {
  final IValidator<DateTime>? _validator;

  DateTimeCubit({IValidator<DateTime>? validator})
    : _validator = validator,
      super(const DateTimeState());

  void onSelectDate(DateTime? dateTime) {
    final error = _validator?.validate(dateTime);
    emit(state.copyWith(dateTime: dateTime, fieldError: error));
  }

  String? validate() {
    final dateTime = state.dateTime;
    final error = _validator?.validate(dateTime);
    emit(state.copyWith(fieldError: error));
    return error;
  }

  void clear() => emit(const DateTimeState());
}
