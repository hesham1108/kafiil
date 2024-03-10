import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil/core/widgets/app_text_form_field.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';

class BirthDateField extends StatelessWidget {
  final AuthCubit? cubit;
  final String? birthDate;
  const BirthDateField({
    super.key,
    this.cubit,
    this.birthDate,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return AppTextFormField(
          label: 'Birth Date',
          enabled: false,
          initialValue: birthDate,
          controller: cubit?.birthDateController,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/icons/callender.svg',
            ),
          ),
          onTap: birthDate != null
              ? null
              : () async {
                  DateTime? selected = await showDatePicker(
                    context: context,
                    firstDate: DateTime.parse('1800-01-01'),
                    lastDate: DateTime.now(),
                    currentDate: cubit?.birthDateController.text.trim() != '' &&
                            cubit?.birthDateController.text.trim() != 'null' &&
                            cubit!.birthDateController.text.isNotEmpty
                        ? DateTime.parse(
                            cubit!.birthDateController.text,
                          )
                        : DateTime.now(),
                  );
                  if (selected != null) {
                    cubit?.setBirthDate(selected);
                  }
                },
        );
      },
    );
  }
}
