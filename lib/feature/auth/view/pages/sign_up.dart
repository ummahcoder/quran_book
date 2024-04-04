import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_book/core/services/send_sms.dart';
import 'package:quran_book/core/style/colors.dart';
import 'package:quran_book/core/style/images/images.dart';
import 'package:quran_book/data/entity/auth_model/sms_model.dart';

import '../../../../core/local/words.dart';
import '../widgets/textfields_w.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _checkbox = false;
  TextEditingController phoneNumber = TextEditingController();

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
                  "Phone number",
                  style: TextStyle(color: AppColors.c_240F4F, fontSize: 16),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(9),
                    FilteringTextInputFormatter.allow(RegExp(r'\d*')),
                  ],
                  autocorrect: false,
                  controller: phoneNumber,
                  decoration: const InputDecoration(
                    isDense: false,
                    isCollapsed: false,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '+998',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                  ),
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
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(Words.terms.tr(context)),
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
                      onPressed: () async {
                        context.go("/verifyCode");
                        var number = '998' '${phoneNumber.text}';
                        int getRandomCode = Random().nextInt(9999);
                        SendMassageModel data = SendMassageModel(
                            mobilePhone: int.parse(number),
                            message:
                                "Ushbu kodni hech kimga bermang! Uni faqatgina firibgarlar so'rashi mumkin! \n Sizning kodingiz: $getRandomCode",
                            from: 4546);
                        await SendSMS.postData(getsms: data);
                      },
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
                      onPressed: () {
                        context.goNamed("login");
                      },
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
