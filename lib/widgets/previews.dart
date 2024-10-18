import 'package:flutter/material.dart';

import '../models/models.dart';

/// 预览组件，用于展示内容列表
class Previews extends StatelessWidget {
  /// 标题
  final String title;

  /// 内容列表
  final List<Content> contentList;

  /// 构造函数
  const Previews({super.key, required this.title, required this.contentList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 标题区域
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // 内容列表区域，水平滚动
        Container(
          height: 165,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return GestureDetector(
                // 点击事件，打印内容名称
                onTap: () => print(content.name),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // 圆形图片容器
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(content.imageUrl),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: content.color ?? Colors.black, width: 4)),
                    ),
                    // 渐变遮罩层
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.black87,
                                Colors.black45,
                                Colors.transparent
                              ],
                              stops: [
                                0,
                                0.25,
                                1
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: content.color ?? Colors.black, width: 4)),
                    ),
                    // 内容标题图片
                    Positioned(
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: SizedBox(
                          height: 60.0,
                          child: Image.asset(content.titleImageUrl),
                        ))
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
