import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';

// 定义一个名为Sintel的Content对象，包含其图片、标题图片、视频URL和描述
final Content sintelContent = Content(
  name: 'Sintel',
  imageUrl: Assets.sintel,
  titleImageUrl: Assets.sintelTitle,
  videoUrl: Assets.sintelVideoUrl,
  description:
  'A lonely young woman, Sintel, helps and befriends a dragon,\nwhom she calls Scales. But when he is kidnapped by an adult\ndragon, Sintel decides to embark on a dangerous quest to find\nher lost friend Scales.',
);

// 将一个包含多项的映射列表转换为Content对象列表
// 每个映射代表一个Content项，包含名称、图片URL、颜色和标题图片URL
List<Content> createContentList(List<Map<String, String>> items) {
  return items.map((item) => Content(
    name: item['name']!,
    imageUrl: item['imageUrl']!,
    color: item['color'] != null ? Color(int.parse(item['color']!)) : null,
    titleImageUrl: item['titleImageUrl'] ?? '',
  )).toList();
}

// 使用createContentList函数创建一个预览内容列表
final List<Content> previews = createContentList([
  {'name': 'Avatar The Last Airbender', 'imageUrl': Assets.atla, 'color': '0xFFFFA500', 'titleImageUrl': Assets.atlaTitle},
  {'name': 'The Crown', 'imageUrl': Assets.crown, 'color': '0xFFFF0000', 'titleImageUrl': Assets.crownTitle},
  {'name': 'The Crown', 'imageUrl': Assets.crown, 'color': '0xFFFF0000', 'titleImageUrl': Assets.crownTitle},
  // Add more items...
]);

// 使用createContentList函数创建一个“我的列表”内容列表
final List<Content> myList = createContentList([
  {'name': 'Violet Evergarden', 'imageUrl': Assets.violetEvergarden},
  {'name': 'How to Sell Drugs Online (Fast)', 'imageUrl': Assets.htsdof},
  // Add more items...
]);

// 使用createContentList函数创建一个Netflix原创内容列表
final List<Content> originals = createContentList([
  {'name': 'Stranger Things', 'imageUrl': Assets.strangerThings},
  {'name': 'The Witcher', 'imageUrl': Assets.witcher},
  // Add more items...
]);

// 使用createContentList函数创建一个当前热门内容列表
final List<Content> trending = createContentList([
  {'name': 'Explained', 'imageUrl': Assets.explained},
  {'name': 'Avatar The Last Airbender', 'imageUrl': Assets.atla},
  // Add more items...
]);
