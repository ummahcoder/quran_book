import 'package:flutter/material.dart';
import 'package:quran_book/core/style/colors.dart';
import 'package:quran_book/core/style/images/images.dart';

import '../../../../core/local/words.dart';
import '../widgets/textfields_w.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Words.signUp.tr(context),
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.c_240F4F),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  Words.detail.tr(context),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.c_8789a3),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.googleIcon,
                            scale: 3,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            Words.google.tr(context),
                            style: TextStyle(
                                color: AppColors.c_240F4F,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  Words.name.tr(context),
                  style: TextStyle(color: AppColors.c_240F4F, fontSize: 16),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFieldWidget(
                  name: Words.enter.tr(context),
                ),
                const SizedBox(
                  height: 22,
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
                  name: Words.pass.tr(context),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 90,
                      height: 3,
                      color: const Color(0xFFD1CFCF),
                    ),
                    Container(
                      width: 90,
                      height: 3,
                      color: const Color(0xFFD1CFCF),
                    ),
                    Container(
                      width: 90,
                      height: 3,
                      color: const Color(0xFFD1CFCF),
                    ),
                    Container(
                      width: 90,
                      height: 3,
                      color: const Color(0xFFD1CFCF),
                    )
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text.rich(
                      TextSpan(
                        text: 'I agree with ',
                        style: TextStyle(
                          color: AppColors.c_8789a3,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms',
                            style: TextStyle(color: AppColors.c_672cbc),
                          ),
                          const TextSpan(
                            text: ' and ',
                          ),
                          TextSpan(
                            text: 'Privacy',
                            style: TextStyle(
                              color: AppColors.c_672cbc,
                            ),
                          ),
                        ],
                      ),
                    ),
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                        backgroundColor: AppColors.c_672cbc,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        Words.signUp.tr(context),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    Words.have.tr(context),
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
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1, color: AppColors.c_672cbc),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        Words.login.tr(context),
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
