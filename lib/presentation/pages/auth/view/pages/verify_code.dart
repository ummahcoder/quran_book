import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quran_book/presentation/styles/colors.dart';

import '../../../../../infrastructures/services/words.dart';
import '../widgets/textfields_w.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  TextEditingController getPin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter the code that we've sent",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.c_240F4F),
            ),
            const SizedBox(
              height: 30,
            ),
            PinCodeTextField(
              controller: getPin,
              obscureText: true,
              keyboardType: TextInputType.number,
              appContext: context,
              length: 4,
              cursorHeight: 90,
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              pinTheme: PinTheme(
                selectedColor: Colors.amber,
                activeColor: Colors.green,
                shape: PinCodeFieldShape.box,
                borderWidth: 1,
                fieldWidth: 60,
                fieldHeight: 60,
                inactiveColor: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                  onPressed: () {
                    context.go("/homePage");
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    backgroundColor: AppColors.c_672cbc,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Didn't get a code?",
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
                    context.go("/signUp");
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1, color: AppColors.c_672cbc),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text(
                    "Get a new code",
                    style: TextStyle(color: AppColors.c_672cbc, fontSize: 16),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
