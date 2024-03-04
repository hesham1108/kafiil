import 'package:bloc/bloc.dart';

class TogglePasswordCubit extends Cubit<bool> {
  TogglePasswordCubit() : super(false);

  toggle() {
    emit(!state);
  }
}
