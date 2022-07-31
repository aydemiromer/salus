import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit,
    this.height,
    this.width,
  }) : super(key: key);

  final String? imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl!.isNotEmpty
        ? CachedNetworkImage(
            key: key,
            imageUrl: imageUrl!,
            errorWidget: (context, url, response) => const SizedBox.shrink(),
            fit: fit,
            width: width,
            height: height,
          )
        : const SizedBox.shrink();
  }
}
