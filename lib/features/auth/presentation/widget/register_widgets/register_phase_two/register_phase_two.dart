import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/core/helpers/extensions.dart';
import 'package:kafiil/core/routing/routes.dart';
import 'package:kafiil/features/auth/presentation/widget/fieldes/about_field.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/avatar.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/birth_date_field.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/gender_widget.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/salary_widget.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/skills_widget.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/social_media_widget.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../../core/widgets/app_text_button.dart';
import '../../../logic/cubit/auth_cubit.dart';

class RegisterPhaseTwo extends StatelessWidget {
  final AuthCubit cubit;

  const RegisterPhaseTwo({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.phaseTwoFormKey,
      child: Padding(
        padding: EdgeInsets.only(top: 0.02.sh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Avatar(),
            // AppTextFormField(
            //   controller: cubit.aboutController,
            //   maxLines: 4,
            //   label: 'About',
            // ),
            AboutField(cubit: cubit),
            verticalSpace(10),
            SalaryWidget(),
            verticalSpace(10),
            BirthDateField(cubit: cubit),
            verticalSpace(10),
            GenderWidget(cubit: cubit),
            verticalSpace(10),
            SkillsWidget(cubit: cubit),
            verticalSpace(10),
            SocialMediaWidget(cubit: cubit),
            verticalSpace(25),
            AppTextButton(
              buttonText: 'Submit',
              backgroundColor: ColorsManager.mainColor,
              textStyle: TextStyles.font16WhiteMedium,
              onPressed: () async {
                context.pushNamed(Routes.homeScreen);
                // await validateThenDoLogin(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
