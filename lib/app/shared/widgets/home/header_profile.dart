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
            child: foto.isEmpty
                ? Image.asset(
                    'assets/img/default.png',
                  )
                : Image.network(foto),
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
