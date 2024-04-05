import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class TongiZikrDetailsScreen extends StatefulWidget {
  final String zikrName;
  final String zikrKey;
  final String zikrValue;
  final String imagePath;

  const TongiZikrDetailsScreen({
    super.key,
    required this.zikrName,
    required this.zikrKey,
    required this.zikrValue,
    required this.imagePath,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TongiZikrDetailsScreenState createState() => _TongiZikrDetailsScreenState();
}

class _TongiZikrDetailsScreenState extends State<TongiZikrDetailsScreen> {
  int zikrTime = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Center(
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height - 400,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.8),
                      ),
                      padding: const EdgeInsets.all(24.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.zikrKey,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              widget.zikrValue,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        zikrTime++;
                      });
                      if (zikrTime == 33) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Future.delayed(const Duration(milliseconds: 7500),
                                () {
                              setState(() {
                                zikrTime = 0;
                              });
                              Navigator.pop(context);
                            });
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Lottie.asset(
                                        "assets/icons/congrulations.json",
                                        width: 250,
                                        height: 250,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Lottie.asset(
                                        "assets/icons/congrulations.json",
                                        width: 250,
                                        height: 250,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: Lottie.asset(
                                        "assets/icons/congrulations.json",
                                        width: 250,
                                        height: 250,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Lottie.asset(
                                        "assets/icons/congrulations.json",
                                        width: 250,
                                        height: 250,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Center(
                                        child: AnimatedTextKit(
                                          animatedTexts: [
                                            ScaleAnimatedText(
                                              'Ma shaa Allah!',
                                              textAlign: TextAlign.center,
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                          // totalRepeatCount: 4,
                                          // pause: const Duration(
                                          //     milliseconds: 1000),
                                          // displayFullTextOnTap: true,
                                          // stopPauseOnTap: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: Center(
                        child: Text(
                          zikrTime.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      "assets/images/go_back.png",
                      width: 34,
                      height: 34,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
