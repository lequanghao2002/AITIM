import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/logger.dart';
import 'package:lookup_app/core/constants/color_constants.dart';

class ImageHelper {
  static Widget loadFromAsset(
    String imageFilePath, {
    double? width,
    double? height,
    BorderRadius? radius,
    BoxFit? fit,
    Color? tintColor,
    Alignment? alignment,
  }) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image.asset(
        imageFilePath,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        color: tintColor,
        alignment: alignment ?? Alignment.center,
      ),
    );
  }

  static Widget loadFromNetwork(
    String imageFilePath, {
    double? width,
    double? height,
    BorderRadius? radius,
    BoxFit? fit,
    Color? tintColor,
    Alignment? alignment,
  }) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image.network(
        imageFilePath,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
              width: 160,
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorPalette.primaryColor,
                ),
              ));
        },
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        color: tintColor,
        alignment: alignment ?? Alignment.center,
      ),
    );
  }
}
