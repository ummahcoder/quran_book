import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_book/presentation/routes/routes.dart';
import 'package:quran_book/presentation/styles/colors.dart';

import '../../../../../infrastructures/services/words.dart';
import '../widgets/textfields_w.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _checkbox = false;

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Words.loginPage.tr(context),
                  style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.c_240F4F),
                ),
                Text(
                  Words.email.tr(context),
                  style: TextStyle(color: AppColors.c_240F4F, fontSize: 16),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFieldWidget(
                  name: Words.emailEnter.tr(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Valid Email")),
                    );
                    return null;
                  },
                ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  Words.password.tr(context),
                  style: TextStyle(color: AppColors.c_240F4F, fontSize: 16),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFieldWidget(
                  name: Words.loginPass.tr(context),
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context, AppRoutes.getLoginPage(context: context));
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                        backgroundColor: AppColors.c_672cbc,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        Words.login.tr(context),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    Words.haveAN.tr(context),
                    style: TextStyle(
                      color: AppColors.c_8789a3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context, AppRoutes.getSignUpPage(context: context));
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1, color: AppColors.c_672cbc),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        Words.signUp.tr(context),
                        style:
                            TextStyle(color: AppColors.c_672cbc, fontSize: 16),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
