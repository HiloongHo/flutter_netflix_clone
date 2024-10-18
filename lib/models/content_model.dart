   import 'package:flutter/material.dart';

   /// 表示流媒体服务中的内容项的类。
   /// 该类包含内容的基本信息，包括名称、图像URL和其他可选属性。
   class Content {
     /// 内容的名称，必需参数。
     final String name;

     /// 内容图像的URL，必需参数。
     final String imageUrl;

     /// 标题图像的URL，必需参数。
     final String titleImageUrl;

     /// 内容视频的URL，可选参数。
     final String? videoUrl;

     /// 内容的描述，可选参数。
     final String? description;

     /// 内容的自定义颜色，可选参数。
     final Color? color;

     /// Content 类的构造函数。
     ///
     /// 参数：
     /// - name: 内容的名称，必需。
     /// - imageUrl: 内容图像的URL，必需。
     /// - titleImageUrl: 标题图像的URL，必需。
     /// - videoUrl: 内容视频的URL，可选。
     /// - description: 内容的描述，可选。
     /// - color: 内容的自定义颜色，可选。
     const Content({
       required this.name,
       required this.imageUrl,
       required this.titleImageUrl,
       this.videoUrl,
       this.description,
       this.color,
     });
   }
   