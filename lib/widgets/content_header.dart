import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/models.dart';
import 'widgets.dart';

// ContentHeader组件用于展示内容的头部信息
class ContentHeader extends StatelessWidget {
  // 定义一个用于存储特色内容的属性
  final Content featuredContent;

  // 构造函数，初始化特色内容
  const ContentHeader({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    // 根据设备类型返回不同的内容头部布局
    return Responsive(
      desktop: _ContentHeaderDesktop(featuredContent: featuredContent),
      mobile: _ContentHeaderMobile(featuredContent: featuredContent),
    );
  }
}

// 适用于桌面的内容头部组件
class _ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  const _ContentHeaderDesktop({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  @override
  __ContentHeaderDesktopState createState() => __ContentHeaderDesktopState();
}

// 状态管理类，用于控制视频播放器及其状态
class __ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  late VideoPlayerController _videoController; // 视频播放器控制器
  bool _isMuted = true; // 声音静音状态

  @override
  void initState() {
    super.initState();
    // 初始化视频播放器，设置视频 URL，并开始播放
    _videoController = VideoPlayerController.networkUrl(
        Uri.parse(widget.featuredContent.videoUrl!))
      ..initialize().then((_) => setState(() {})) // 视频初始化完成后重建状态
      ..setVolume(0) // 默认静音
      ..play(); // 开始播放视频
  }

  @override
  void dispose() {
    _videoController.dispose(); // 释放视频播放器资源
    super.dispose();
  }

  // 切换静音状态的函数
  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted; // 切换静音状态
      _videoController.setVolume(_isMuted ? 0 : 1); // 根据静音状态设置音量
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
          ? _videoController.pause() // 暂停视频
          : _videoController.play(), // 播放视频
      child: Stack(
        alignment: Alignment.bottomLeft, // 对齐方式
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized
                ? _videoController.value.aspectRatio // 根据视频的实际宽高比设置
                : 2.344, // 默认宽高比
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController) // 显示视频
                : Image.asset(
              widget.featuredContent.imageUrl,
              fit: BoxFit.cover, // 适应容器大小
            ),
          ),
          _buildGradientOverlay(), // 添加渐变覆盖层
          _buildContent(), // 添加内容
        ],
      ),
    );
  }

  // 构建渐变覆盖层
  Widget _buildGradientOverlay() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: -1.0,
      child: AspectRatio(
        aspectRatio: _videoController.value.isInitialized
            ? _videoController.value.aspectRatio
            : 2.344,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
    );
  }

  // 构建内容部分
  Widget _buildContent() {
    return Positioned(
      left: 60.0,
      right: 60.0,
      bottom: 150.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 250.0,
            child: Image.asset(widget.featuredContent.titleImageUrl!),
          ),
          const SizedBox(height: 15.0),
          Text(
            widget.featuredContent.description!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(2.0, 4.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              _PlayButton(), // 播放按钮
              const SizedBox(width: 16.0),
              TextButton.icon(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
                  backgroundColor: Colors.white,
                ),
                onPressed: () => print('More Info'), // 更多信息的点击事件
                icon: const Icon(Icons.info_outline, size: 30.0),
                label: const Text(
                  'More Info',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              if (_videoController.value.isInitialized)
                IconButton(
                  icon: Icon(
                    _isMuted ? Icons.volume_off : Icons.volume_up, // 根据静音状态显示图标
                  ),
                  color: Colors.white,
                  iconSize: 30.0,
                  onPressed: _toggleMute, // 切换静音状态
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// 适用于移动设备的内容头部组件
class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _ContentHeaderMobile({required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // 背景图像容器
        Container(
          height: MediaQuery.of(context).size.height * 0.5, // 自适应高度
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // 渐变色容器
        Container(
          height: MediaQuery.of(context).size.height * 0.5, // 自适应高度
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        // 特色内容的标题图像
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl ?? ""),
          ),
        ),
        // 操作按钮容器
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
                onTap: () => print('My List'), // 添加到列表的点击事件
              ),
              _PlayButton(), // 播放按钮
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'Info',
                onTap: () => print('Info'), // 信息按钮的点击事件
              ),
            ],
          ),
        ),
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
      onPressed: () => print('Play'), // 播放按钮的点击事件
      icon: const Icon(Icons.play_arrow, size: 30),
      label: const Text(
        'Play',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 设置文本和图标颜色
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // 设置内边距
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // 设置圆角
        ),
      ),
    );
  }
}