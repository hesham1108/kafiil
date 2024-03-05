import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theming/colors.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 1.sw,
            padding: const EdgeInsets.only(bottom: 10),
            // height:,
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: 0.3.sw,
              height: 0.3.sw,
              // padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsManager.mainColor,
                ),
              ),
              child: Image.asset(
                'assets/images/avatar.png',
              ),
            ),
          ),
          Positioned(
              bottom: -(0.01.sw),
              right: (0.27.sw),
              child: InkWell(
                onTap: () {
                  debugPrint('lol');
                },
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                child: Container(
                  width: 0.15.sw,
                  height: 0.15.sw,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.mainColor,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 0.1.sw,
                    color: ColorsManager.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
