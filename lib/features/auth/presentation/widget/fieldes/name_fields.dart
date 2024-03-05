import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';

import '../../../../../core/helpers/validators.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class NameFields extends StatelessWidget {
  final AuthCubit? cubit;
  final String? firstName, lastName;
  const NameFields({
    super.key,
    this.cubit,
    this.firstName,
    this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: AppTextFormField(
            label: 'First Name',
            enabled: firstName == null,
            initialValue: firstName,
            validator: Validators.firstNameValidator,
            controller: cubit?.firstNameController,
          ),
        ),
        10.horizontalSpace,
        Expanded(
          flex: 3,
          child: AppTextFormField(
            label: 'Last Name',
            enabled: lastName == null,
            initialValue: lastName,
            validator: Validators.lastNameValidator,
            controller: cubit?.lastNameController,
          ),
        ),
      ],
    );
  }
}
