import 'package:reusable_editor/view_models/field_cubits/field_cubit/field_cubit.dart';

class DateTimeCubit extends FieldCubit<DateTime> {
  DateTimeCubit({super.validator});
}

// part 'date_time_state.dart';

// class DateTimeCubit extends Cubit<DateTimeState> {
//   final IValidator<DateTime>? _validator;
//
//   DateTimeCubit({IValidator<DateTime>? validator})
//     : _validator = validator,
//       super(const DateTimeState());
//
//   void onSelectDate(DateTime? dateTime) {
//     final error = _validator?.validate(dateTime);
//     emit(state.copyWith(dateTime: dateTime, fieldError: error));
//   }
//
//   String? validate() {
//     final dateTime = state.dateTime;
//     final error = _validator?.validate(dateTime);
//     emit(state.copyWith(fieldError: error));
//     return error;
//   }
//
//   void clear() => emit(const DateTimeState());
// }
