import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';

class CircularNetworkImage extends StatelessWidget {
  final String? url;
  final double size;
  final String displayName;

  const CircularNetworkImage(
      {super.key,
      required this.url,
      this.size = 125,
      required this.displayName});

  @override
  Widget build(BuildContext context) {
    print(url);
    return CachedNetworkImage(
      imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
      imageUrl: url != null
          ? url?.contains(',') == true
              ? ''
              : url!
          : '',
      imageBuilder: (context, imageProvider) => Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            color: kcWhite,
            shape: BoxShape.circle,
            border: Border.all(color: kcPrimaryColor)),
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, str, error) =>
          url != null && url?.contains(',') == true
              ? Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    color: kcPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image(
                      width: 3 * size / 7,
                      height: 3 * size / 7,
                      image: const AssetImage('assets/icons/group.png'),
                    ),
                  ),
                )
              : Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    color: kcProfileBg,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      getInitials(displayName),
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: kcPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 3 * size / 7),
                    ),
                  ),
                ),
    );
  }

  String getInitials(String fullName) {
    List<String> names = fullName.trim().split(' ');
    if (names.length == 1) return names[0][0].toUpperCase();
    return (names[0][0] + names[names.length - 1][0]).toUpperCase();
  }
}
