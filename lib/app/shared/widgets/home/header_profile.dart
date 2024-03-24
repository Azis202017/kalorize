import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../theme/font.dart';

class HeaderProfile extends StatelessWidget {
  final String name;
  final String foto;
  final void Function()? onPressed;
  const HeaderProfile({
    super.key,
    required this.name,
    this.foto = "",
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                40,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(48),
              child: foto.isEmpty
                  ? Image.asset(
                      'assets/img/default.png',
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      imageUrl: foto,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai $name 👋',
                  style: title,
                ),
                Text(
                  'Mau makan apa hari ini',
                  style: subTitle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
