import 'package:flutter/material.dart';
import 'package:kafiil/core/theming/colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imgUrl;
  final double? imageWidth, imageHeight;
  const CustomNetworkImage({
    super.key,
    required this.imgUrl,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgUrl,
      width: imageWidth,
      height: imageHeight,
      fit: BoxFit.fitWidth,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return child;
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            ),
          );
        }
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.emoji_emotions_outlined,
                color: ColorsManager.mainColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
