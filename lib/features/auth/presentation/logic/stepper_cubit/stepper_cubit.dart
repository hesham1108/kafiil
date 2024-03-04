import 'package:bloc/bloc.dart';

class StepperCubit extends Cubit<int> {
  StepperCubit() : super(0);

  forwardStep(int step) {
    emit(step);
  }
}
