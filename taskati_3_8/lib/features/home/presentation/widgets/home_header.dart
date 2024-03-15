import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_3_8/core/constants/assets_icons.dart';
import 'package:taskati_3_8/core/services/local_storage.dart';
import 'package:taskati_3_8/core/utils/app_colors.dart';
import 'package:taskati_3_8/core/utils/text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? path = AppLocalStorage.getCachedData('image');
    String? name = AppLocalStorage.getCachedData('name');
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $name',
              style: getTitleStyle(color: AppColors.primary),
            ),
            const Gap(5),
            Text(
              'Have A Nice Day',
              style: getBodyStyle(),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 25,
          backgroundImage: (path != null)
              ? FileImage(File(path)) as ImageProvider
              : AssetImage(AssetsIcons.user),
        ),
      ],
    );
  }
}
