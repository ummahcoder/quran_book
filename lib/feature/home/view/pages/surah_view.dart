import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart';

import '../../../../core/style/colors.dart';

class SurahView extends StatelessWidget {
  final int surahNumber;

  const SurahView(this.surahNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> ayahs = getAyahsForSurah(surahNumber);
    int verseCount = getVerseCount(surahNumber);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          getSurahName(surahNumber),
          style: TextStyle(
            color: AppColors.c_672cbc,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/images/surah_card.png",
                  width: double.infinity,
                  height: 295,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        getSurahName(surahNumber),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 26),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        getSurahNameEnglish(surahNumber),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const Divider(
                        indent: 80,
                        endIndent: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            getPlaceOfRevelation(surahNumber),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            verseCount.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: verseCount,
              itemBuilder: (context, index) {
                int ayahNumber = index + 1;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 47,
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          border: Border.all(
                              width: 1, color: const Color(0xFF121931)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.c_672cbc,
                                ),
                                child: Center(
                                  child: Text(
                                    ayahNumber.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  for (var image in [
                                    "assets/images/share.png",
                                    "assets/images/play.png",
                                    "assets/images/save.png",
                                  ]) ...[
                                    Image.asset(image),
                                    const SizedBox(width: 8),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 20),
                        child: SizedBox(
                          child: RichText(
                            textAlign: TextAlign.justify,
                            textDirection: TextDirection.rtl,
                            text: TextSpan(
                              text: ayahs[index],
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: AppColors.c_240F4F,
                                fontFamily: GoogleFonts.amiriQuran().fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: getVerseTranslation(
                                surahNumber,
                                ayahNumber,
                              ),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.c_240F4F,
                                fontFamily: GoogleFonts.amiri().fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<String> getAyahsForSurah(int surahNumber) {
  return List.generate(
    getVerseCount(surahNumber),
    (index) => getVerse(surahNumber, index + 1),
  );
}
