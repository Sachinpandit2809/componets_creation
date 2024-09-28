import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageViewerHelper {
  ImageViewerHelper._();

  static Show({
    required BuildContext context,
    required String url,
    BoxFit? fit,
    double? radius,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit ?? BoxFit.cover,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image:
                DecorationImage(image: imageProvider, fit: fit ?? BoxFit.cover),
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
        );
      },
      placeholder:(context, url )=> Container(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
