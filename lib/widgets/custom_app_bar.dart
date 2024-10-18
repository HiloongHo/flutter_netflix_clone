import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';

/**
 * 自定义AppBar类，用于创建Netflix应用的顶部导航栏。
 *
 * 此类继承自StatelessWidget，提供一个可滚动的AppBar，其透明度根据滚动位置动态变化。
 *
 * 参数:
 * - scrollOffset: 控制AppBar透明度的滚动偏移量，默认值为0.0。
 */
class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({super.key, this.scrollOffset = 0.0});

  @override
  Widget build(BuildContext context) {
    // 返回一个Container，包含AppBar的布局和样式。
    // 其中透明度根据scrollOffset动态计算，确保在特定滚动范围内实现渐变效果。
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      color: Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
          child: Row(
        children: [
          // 显示Netflix的logo。
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12.0,
          ),
          // 占据剩余空间，并在其中均匀分布导航按钮。
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: 'TV Shows',
                  onTap: () => print('TV Shows'),
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () => print('Movies'),
                ),
                _AppBarButton(
                  title: 'My List',
                  onTap: () => print('My List'),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

/**
 * AppBar按钮组件，用于显示可点击的文本按钮。
 *
 * 此类继承自StatelessWidget，用于在AppBar上创建一个带有特定标题和点击事件的按钮。
 *
 * 参数:
 * - title: 按钮的显示文本。
 * - onTap: 按钮被点击时执行的回调函数。
 */
class _AppBarButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _AppBarButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // 返回一个可点击的GestureDetector，包含按钮的文本样式。
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
