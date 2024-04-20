import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se7ety_4_5/core/functions/routing.dart';
import 'package:se7ety_4_5/features/auth/presentation/views/doctor_register_data.dart';
import 'package:se7ety_4_5/features/intro/onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      pushToWithReplacement(
          context,
          FirebaseAuth.instance.currentUser == null
              ? const OnboardingView()
              : const DoctorUploadData());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 250,
        ),
      ),
    );
  }
}
