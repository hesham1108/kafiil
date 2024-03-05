import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/core/theming/styles.dart';
import 'package:kafiil/features/auth/presentation/widget/fieldes/about_field.dart';
import 'package:kafiil/features/auth/presentation/widget/fieldes/email_field.dart';
import 'package:kafiil/features/auth/presentation/widget/fieldes/name_fields.dart';
import 'package:kafiil/features/auth/presentation/widget/fieldes/password_field.dart';
import 'package:kafiil/features/auth/presentation/widget/fieldes/salary_field.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_one/user_types_widget.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/avatar.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/birth_date_field.dart';
import 'package:kafiil/features/auth/presentation/widget/register_widgets/register_phase_two/gender_widget.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0.022.sh,
        horizontal: 0.04.sw,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Who Am I',
              style: TextStyles.font18BlackSimiBold,
            ),
            20.verticalSpaceFromWidth,
            const Avatar(),
            20.verticalSpaceFromWidth,
            const NameFields(firstName: 'Hesham', lastName: 'Othman'),
            15.verticalSpaceFromWidth,
            const EmailField(email: 'heshamosman711@gmail.com'),
            15.verticalSpaceFromWidth,
            PasswordField(password: '12345678'),
            15.verticalSpaceFromWidth,
            UserTypesWidget(selectedIndex: 1),
            15.verticalSpaceFromWidth,
            const AboutField(about: 'about about about about about'),
            15.verticalSpaceFromWidth,
            const SalaryField(salary: 'SAR 1000'),
            15.verticalSpaceFromWidth,
            const BirthDateField(birthDate: '1997-11-15'),
            15.verticalSpaceFromWidth,
            GenderWidget(selectedIndex: 1),

            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Column(
            //     children: [
            //       InkWell(
            //         onTap: context.read<AuthCubit>().logout,
            //         child: Container(
            //           padding: const EdgeInsets.all(15),
            //           decoration: const BoxDecoration(
            //             color: ColorsManager.mainColor,
            //             borderRadius: BorderRadius.all(Radius.circular(15)),
            //           ),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               const Icon(
            //                 Icons.logout,
            //                 color: Colors.white,
            //               ),
            //               15.horizontalSpace,
            //               Text(
            //                 'Logout',
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 15.sp,
            //                   fontWeight: FontWeight.w900,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const LogoutBlocListener(),
          ],
        ),
      ),
    );
  }
}
