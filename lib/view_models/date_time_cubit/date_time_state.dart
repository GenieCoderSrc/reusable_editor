part of 'date_time_cubit.dart';

class DateTimeState extends Equatable {
  final DateTime? dateTime;
  const DateTimeState({this.dateTime});

  DateTimeState copyWith({DateTime? dateTime}) {
    return DateTimeState(dateTime: dateTime ?? this.dateTime);
  }

  DateTimeState clear() => const DateTimeState(dateTime: null);

  @override
  List<Object?> get props => [dateTime];
}
