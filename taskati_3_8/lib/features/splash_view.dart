import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_3_8/core/constants/assets_icons.dart';
import 'package:taskati_3_8/core/functions/routing.dart';
import 'package:taskati_3_8/core/utils/text_styles.dart';
import 'package:taskati_3_8/features/home/presentation/view/home_view.dart';
import 'package:taskati_3_8/features/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    var box = Hive.box('user');
    bool isUpload = box.get('isUpload') ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      pushWithReplacment(
          context, isUpload ? const HomeView() : const UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Lottie.asset(AssetsIcons.logo),
            const Gap(15),
            Text(
              'Taskati',
              style: getTitleStyle(context, fontSize: 22),
            ),
            const Gap(15),
            Text(
              'It\'s Time To Get Organized',
              style: getSmallStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
