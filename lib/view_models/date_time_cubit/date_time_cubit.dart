import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'date_time_state.dart';

class DateTimeCubit extends Cubit<DateTimeState> {
  DateTimeCubit() : super(const DateTimeState());

  onSelectDate(DateTime? dateTime) {
    if (dateTime != null) {
      emit(state.copyWith(dateTime: dateTime));
    }
  }

  clearDateTime() => state.clear();
}
