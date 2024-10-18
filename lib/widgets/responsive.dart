import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile; // mobile 和 tablet 都是可选参数
  final Widget? tablet;
  final Widget desktop; // desktop 仍然是必需参数

  const Responsive({
    Key? key, // key 也应为可选参数
    this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktop;
        } else if (constraints.maxWidth >= 800) {
          return tablet ??
              mobile ??
              Container(); // 如果 tablet 和 mobile 都为 null，返回一个空的 Container
        } else {
          return mobile ?? Container(); // 如果 mobile 为 null，返回一个空的 Container
        }
      },
    );
  }
}
