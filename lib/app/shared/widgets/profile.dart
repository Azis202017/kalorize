import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kalorize/app/shared/theme/color.dart';

import '../theme/font.dart';

class ProfileWidget extends StatelessWidget {
  final String name;
  final XFile? foto;
  final String kodeGym;
  final String namaGym;
  final void Function()? onPressed;
  const ProfileWidget({
    super.key,
    required this.name,
    required this.kodeGym,
    required this.namaGym,
    this.foto,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                children: [
                  foto != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(
                            120,
                          ),
                          child: Image.file(
                            width: 120,
                            height: 120,
                            File(
                              foto?.path ?? "",
                            ),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.asset(
                          'assets/img/default_profile.png',
                        ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: mainPrimary,
                      child: Center(
                        child: Image.asset(
                          'assets/img/camera.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          name,
          style: title,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                height: 23,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: backgroundSecondary),
                child: Text(
                  kodeGym,
                  style: caption,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                namaGym,
              ),
            ],
          ),
        )
      ],
    );
  }
}
