import 'package:flutter_bloc/flutter_bloc.dart';

enum SelectedDate {
  today,
  tomorrow,
}

class LandingSelectedDateCubit extends Cubit<SelectedDate> {
  LandingSelectedDateCubit() : super(SelectedDate.today);

  void update(SelectedDate selectedDate) {
    emit(selectedDate);
  }
}
