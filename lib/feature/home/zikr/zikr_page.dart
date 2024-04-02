import 'package:flutter/material.dart';
import '../../../core/style/colors.dart';

class ZikrPage extends StatelessWidget {
  const ZikrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        surfaceTintColor: Colors.white,
        title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Zikr",
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.c_672cbc,
                  fontWeight: FontWeight.bold),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/quddus.png",
                      scale: 3.8,
                    ),
                    const Positioned(
                      top: 60,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Barcha\nzikrlar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "38 zikr",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Stack(
                  children: [
                    Expanded(
                      child: Image.asset(
                        "assets/images/tuyacha.png",
                        scale: 3.8,
                      ),
                    ),
                    const Positioned(
                      top: 60,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mening\nsevimlilarim",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Saralanganlar yo'q",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Expanded(
                      child: Image.asset(
                        "assets/images/istanbul.png",
                        scale: 3.7,
                      ),
                    ),
                    const Positioned(
                      top: 60,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tongi\nzikrlar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "11 azkar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Expanded(
                      child: Image.asset(
                        "assets/images/night.png",
                        scale: 3.7,
                      ),
                    ),
                    const Positioned(
                      top: 60,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kechki \nzikrlar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "11 azkar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Oxirgi zikringiz",
                style: TextStyle(color: Color(0xFF6F6868), fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Image.asset("assets/images/final.png"),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "0/33",
                        style: TextStyle(
                            color: Color(0xFF6F6868),
                            fontWeight: FontWeight.w500,
                            fontSize: 40),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Falastin uchun duo",
                            style: TextStyle(
                                color: Color(0xFF6F6868),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "5 kun oldin",
                            style: TextStyle(
                                color: Color(0xFF6F6868),
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
