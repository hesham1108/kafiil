import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';

part 'salary_state.dart';

class SalaryCubit extends Cubit<int> {
  SalaryCubit() : super(1000);

  changeSalary(bool increase, BuildContext context) {
    if (increase) {
      emit(state + 100);
    } else {
      emit(state <= 1000 ? 1000 : state - 100);
    }
    context.read<AuthCubit>().setSalary(state);
  }
}
