import 'package:flutter/material.dart';

import '../models/content_model.dart';

/// 自定义的ContentList小部件，用于展示一个内容列表
///
/// [title] 列表的标题
/// [contentList] 要展示的内容列表
/// [isOriginals] 是否是原创内容，这个标志用于决定列表的展示样式
class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  const ContentList(
      {super.key,
      required this.title,
      required this.contentList,
      this.isOriginals = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // 标题区域
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // 内容区域
        Container(
            height: isOriginals ? 500 : 220,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: () => print(content.name),
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      height: isOriginals ? 400 : 200,
                      width: isOriginals ? 200 : 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(content.imageUrl),
                              fit: BoxFit.cover))),
                );
              },
            ))
      ]),
    );
  }
}
