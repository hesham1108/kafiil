import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/core/theming/colors.dart';
import 'package:kafiil/core/theming/styles.dart';
import 'package:kafiil/features/auth/presentation/logic/toggle_password_cubit/toggle_password_cubit.dart';

import '../../../logic/cubit/auth_cubit.dart';

class CustomCheckBox extends StatelessWidget {
  final String title;
  final bool remember;
  final AuthCubit cubit;
  CustomCheckBox({
    super.key,
    required this.title,
    required this.cubit,
    this.remember = false,
  });

  final TogglePasswordCubit toggle = TogglePasswordCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: toggle,
      child: BlocBuilder<TogglePasswordCubit, bool>(
        builder: (context, state) {
          return Row(
            children: [
              GestureDetector(
                onTap: toggle.toggle,
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color:
                        state ? ColorsManager.mainColor : ColorsManager.white,
                    border: Border.all(
                      width: 2,
                      color: state
                          ? ColorsManager.mainColor
                          : ColorsManager.grey300,
                    ),
                  ),
                  child: Icon(
                    Icons.done,
                    color: ColorsManager.white,
                    size: 0.045.sw,
                  ),
                ),
              ),
              Text(
                title,
                style: remember
                    ? TextStyles.font12GreyMedium
                    : TextStyles.font14BlackMedium,
              ),
            ],
          );
        },
      ),
    );
  }
}
