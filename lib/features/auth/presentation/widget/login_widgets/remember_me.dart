import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil/core/theming/colors.dart';
import 'package:kafiil/core/theming/styles.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool remember = false;

  toggleRemember() {
    remember = !remember;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: toggleRemember,
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              color: remember ? ColorsManager.mainColor : ColorsManager.white,
            ),
            child: Icon(
              Icons.done,
              color: ColorsManager.white,
              size: 0.045.sw,
            ),
          ),
        ),
        Text(
          'Remember me',
          style: TextStyles.font12GreyMedium,
        ),
      ],
    );
  }
}
