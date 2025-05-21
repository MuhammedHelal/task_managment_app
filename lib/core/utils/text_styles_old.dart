import 'package:flutter/material.dart';
import 'package:planning_app/core/utils/colors.dart';

abstract class TodoTextStyles {
  static const TextStyle black16W500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static const TextStyle black16W300 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
  static const TextStyle black16Normal = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );
}

abstract class FolderTextStyles {
  static const TextStyle active = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle notActive = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static const TextStyle folderLength = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );
}

abstract class AppTextStyles {
  static const TextStyle black25Bold = TextStyle(
    color: AppColors.black,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle black20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle black18Bold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle black18SemiBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static const TextStyle black18 = TextStyle(
    fontSize: 18,
    color: Colors.black,
  );
  static const TextStyle black16 = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
  static const TextStyle black14 = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );
  static const TextStyle black12 = TextStyle(
    fontSize: 12,
    color: Colors.black,
  );
  static const TextStyle white20Bold = TextStyle(
    fontSize: 20, // 20
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle white18 = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );
  static const TextStyle white16 = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );
}
