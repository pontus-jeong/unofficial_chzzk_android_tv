import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/styles.dart';

class OptimizedCachedNetworkImage extends StatelessWidget {
  ///
  const OptimizedCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageBuilder,
    this.imageHeight,
  });

  final String imageUrl;
  final double imageWidth;
  final double? imageHeight;
  final Widget Function(BuildContext context, ImageProvider imageProvider)
      imageBuilder;

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final int cacheSize = (imageWidth * devicePixelRatio).round();

    return CachedNetworkImage(
      key: UniqueKey(),
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      maxWidthDiskCache: cacheSize,
      memCacheWidth: cacheSize,
      placeholder: (context, url) => SizedBox(
        width: imageWidth,
        height: imageHeight,
      ),
      errorWidget: (context, url, error) {
        return SizedBox(
          width: imageWidth,
          height: imageHeight,
          child: const Center(
            child: Text(
              '오류',
              style: TextStyle(color: AppColors.redColor),
            ),
          ),
        );
      },
    );
  }
}

class OptimizedNetworkImage extends StatelessWidget {
  const OptimizedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.imageWidth,
    this.imageHeight,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double imageWidth;
  final double? imageHeight;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final int cacheWidth = (imageWidth * devicePixelRatio).round();

    final int? cacheHeight =
        imageHeight == null ? null : (imageHeight! * devicePixelRatio).round();

    return Image.network(
      key: UniqueKey(),
      imageUrl,
      width: imageWidth,
      height: imageHeight,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          width: imageWidth,
          height: imageHeight,
          child: const Center(
            child: Text(
              '이미지 로딩 에러',
              style: TextStyle(color: AppColors.redColor),
            ),
          ),
        );
      },
    );
  }
}

class OptimizedAssetImage extends StatelessWidget {
  const OptimizedAssetImage({
    super.key,
    required this.imagePath,
    required this.imageWidth,
    this.imageHeight,
    this.fit = BoxFit.cover,
  });

  final String imagePath;
  final double imageWidth;
  final double? imageHeight;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final int cacheWidth = (imageWidth * devicePixelRatio).round();

    return Image.asset(
      key: UniqueKey(),
      imagePath,
      width: imageWidth,
      height: imageHeight,
      cacheWidth: cacheWidth,
      fit: fit,
    );
  }
}
