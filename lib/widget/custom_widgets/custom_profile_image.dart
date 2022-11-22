import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'show_loading.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    required this.imageURL,
    this.radius = 40,
    Key? key,
  }) : super(key: key);
  final String imageURL;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return imageURL.isEmpty
        ? Container(
            height: radius,
            width: radius,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const FittedBox(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageURL,
              width: radius,
              height: radius,
              fit: BoxFit.cover,
              placeholder: (BuildContext context, String url) =>
                  const ShowLoading(),
              errorWidget: (BuildContext context, String url, _) =>
                  const Icon(Icons.error),
            ),
          );
  }
}