import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil/core/widgets/app_text_form_field.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';

class BirthDateField extends StatelessWidget {
  final AuthCubit cubit;

  const BirthDateField({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      // buildWhen: (current, next) =>
      //     current is AuthBirthDateSelected || next is AuthBirthDateSelected,
      builder: (context, state) {
        return AppTextFormField(
          label: 'Birth Date',
          enabled: false,
          controller: cubit.birthDateController,
          suffixIcon: SvgPicture.asset('assets/icons/callendar.svg'),
          onTap: () async {
            DateTime? selected = await showDatePicker(
              context: context,
              firstDate: DateTime.parse('1800-01-01'),
              lastDate: DateTime.now(),
              currentDate: cubit.birthDateController.text.trim() != '' &&
                      cubit.birthDateController.text.trim() != 'null' &&
                      cubit.birthDateController.text.isNotEmpty
                  ? DateTime.parse(
                      cubit.birthDateController.text,
                    )
                  : DateTime.now(),
            );
            if (selected != null) {
              cubit.setBirthDate(selected);
            }
          },
        );
      },
    );
  }
}