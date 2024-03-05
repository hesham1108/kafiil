import 'package:flutter/material.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/custom_check_box.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/styles.dart';

class SocialMediaWidget extends StatelessWidget {
  final AuthCubit cubit;
  const SocialMediaWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Favorite Social Media', style: TextStyles.font12GreyMedium),
        verticalSpace(8),
        CustomCheckBox(
          title: 'Facebook',
          cubit: cubit,
        ),
        verticalSpace(8),
        CustomCheckBox(
          title: 'Twitter',
          cubit: cubit,
        ),
        verticalSpace(8),
        CustomCheckBox(
          title: 'LinkedIn',
          cubit: cubit,
        ),
        verticalSpace(8),
      ],
    );
  }
}
