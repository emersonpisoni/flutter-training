import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageUtils {
  static Widget getSvgForCondition(String condition) {
    return SvgPicture.asset(
      'assets/icons/ic_$condition.svg',
      color: Colors.white,
    );
  }
}