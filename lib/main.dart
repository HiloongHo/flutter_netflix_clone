import 'package:flutter/material.dart';

import 'screens/screens.dart';

// 程序的入口点
void main() {
  // 启动应用程序
  runApp(MyApp());
}

// MyApp widget是应用程序的根widget
class MyApp extends StatelessWidget {
  // 构建应用程序的用户界面
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 禁用开发者模式的调试横幅
      debugShowCheckedModeBanner: false,
      // 设置应用程序的标题
      title: 'Flutter Netflix UI',
      // 配置应用程序的主题
      theme: ThemeData(
        // 设置主色调为蓝色
        primarySwatch: Colors.blue,
        // 适应平台的视觉密度
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // 设置背景颜色为黑色
        scaffoldBackgroundColor: Colors.black,
      ),
      // 设置应用程序的首页为HomeScreen
      home: HomeScreen(),
    );
  }
}
