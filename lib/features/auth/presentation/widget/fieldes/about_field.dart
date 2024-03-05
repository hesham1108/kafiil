import 'package:flutter/material.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';

import '../../../../../core/widgets/app_text_form_field.dart';

class AboutField extends StatelessWidget {
  final AuthCubit? cubit;
  final String? about;
  const AboutField({
    super.key,
    this.cubit,
    this.about,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      initialValue: about,
      enabled: about == null,
      controller: cubit?.aboutController,
      maxLines: 4,
      label: 'About',
    );
  }
}
