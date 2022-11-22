import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'show_loading.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    required this.imageURL,
    this.fit = BoxFit.cover,
    this.timeLimit = const Duration(days: 2),
    Key? key,
  }) : super(key: key);
  final String imageURL;
  final BoxFit? fit;
  final Duration? timeLimit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      fit: fit,
      placeholder: (BuildContext context, String url) => const ShowLoading(),
      errorWidget: (BuildContext context, String url, _) =>
          const Icon(Icons.error),
    );
  }
}