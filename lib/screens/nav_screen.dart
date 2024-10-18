import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_responsive_ui/cubits/cubits.dart';
import 'package:flutter_netflix_responsive_ui/widgets/responsive.dart';

import 'screens.dart';

/// 主导航屏幕，根据设备类型和用户交互来显示不同的界面
class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

/// _NavScreen状态类，管理导航屏幕的状态
class _NavScreenState extends State<NavScreen> {
  // 定义一个包含各个子屏幕的列表
  final List<Widget> _screens = [
    const HomeScreen(
      key: PageStorageKey("HomeScreen"),
    ),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  // 定义一个包含底部导航栏图标及其对应标题的映射
  final Map<String, IconData> _icons = {
    'Home': Icons.home_outlined,
    'Search': Icons.search_outlined,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu,
  };

  // 记录当前选中的屏幕索引
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 提供AppBarCubit给子屏幕，并根据设备类型决定是否显示底部导航栏
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context) ?
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: _icons
            .map((title, icon) => MapEntry(
                title,
                BottomNavigationBarItem(
                    icon: Icon(
                      icon,
                      size: 30,
                    ),
                    label: title)))
            .values
            .toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 11.0,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11.0,
        onTap: (index) => setState(() => _selectedIndex = index),
      ): null,
    );
  }
}
