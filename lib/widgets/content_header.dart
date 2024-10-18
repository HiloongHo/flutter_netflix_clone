// 导入Flutter基础组件库
import 'package:flutter/material.dart';

// 导入自定义模型和组件库
import '../models/models.dart';
import 'widgets.dart';

// ContentHeader组件用于展示内容的头部信息
// 它以堆叠的方式显示特色内容的背景图像、标题和操作按钮
class ContentHeader extends StatelessWidget {
  // 特色内容数据，包含图像URL和标题图像URL
  final Content featuredContent;

  // 构造函数，初始化特色内容数据
  const ContentHeader({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // 背景图像容器
        Container(
          height: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                  fit: BoxFit.cover)),
        ),
        // 渐变色容器，用于覆盖在背景图像上，实现底部到顶部从黑色到透明的渐变效果
        Container(
            height: 500,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter))),
        // 特色内容的标题图像，位置在底部居中
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(
                featuredContent.titleImageUrl ?? featuredContent.imageUrl),
          ),
        ),
        // 操作按钮容器，包括添加到列表、播放和信息按钮
        Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  icon: Icons.add,
                  title: 'List',
                  onTap: () => print('My List'),
                ),
                _PlayButton(),
                VerticalIconButton(
                  icon: Icons.info_outline,
                  title: 'Info',
                  onTap: () => print('Info'),
                ),
              ],
            ))
      ],
    );
  }
}

// _PlayButton组件用于播放操作按钮
class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => print('Play'),
      icon: const Icon(Icons.play_arrow, size: 30),
      label: const Text(
        'Play',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.white, // 设置文本和图标颜色
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // 设置内边距
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // 设置圆角
        ),
      ),
    );
  }
}
