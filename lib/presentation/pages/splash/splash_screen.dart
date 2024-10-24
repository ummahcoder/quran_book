import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_book/core/style/images/images.dart';
import 'package:quran_book/infrastructures/services/local_controller.dart';
import 'package:quran_book/presentation/styles/colors.dart';

import '../../../infrastructures/services/words.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Quran App",
                  style: TextStyle(
                      color: AppColors.c_672cbc,
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text(
                Words.splash_learn.tr(context),
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.c_8789a3, fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                AppImages.create.splashImage,
                width: 314,
                height: 450,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 185,
                height: 60,
                child: OutlinedButton(
                  onPressed: () {
                    context.go("/homePage");
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    backgroundColor: AppColors.c_9b091,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    Words.get_started.tr(context),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold), // Text color
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        child: CircleFlag("us"),
                      ),
                      TextButton(
                          onPressed: () {
                            localeController.changeLang(Language.en);
                          },
                          child: Text(
                            Words.en.tr(context),
                            style: TextStyle(
                                color: AppColors.c_240F4F, fontSize: 10),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        child: CircleFlag("ru"),
                      ),
                      TextButton(
                          onPressed: () {
                            localeController.changeLang(Language.ru);
                          },
                          child: Text(
                            Words.ru.tr(context),
                            style: TextStyle(
                                color: AppColors.c_240F4F, fontSize: 10),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        child: CircleFlag(
                          "uz",
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            localeController.changeLang(Language.uz);
                          },
                          child: Text(
                            Words.uz.tr(context),
                            style: TextStyle(
                                color: AppColors.c_240F4F, fontSize: 10),
                          ))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
