import 'package:chat_app_ui/auth/signin_view.dart';
import 'package:chat_app_ui/auth/widgets/custom_btn.dart';
import 'package:chat_app_ui/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isNotVisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Create A New Account',
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(
                  label: 'Name',
                  prefixIcon: Icons.person,
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomTextField(
                  label: 'Email',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  label: 'Password',
                  obscureText: isNotVisable,
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isNotVisable = !isNotVisable;
                        });
                      },
                      icon: Icon((isNotVisable)
                          ? Icons.visibility_off_rounded
                          : Icons.remove_red_eye_rounded)),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already i have an account'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const SigninView(),
                          ));
                        },
                        child: const Text('login'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
