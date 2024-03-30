import 'package:flutter/material.dart';

class SurahView extends StatelessWidget {
  final int surahNumber;

  SurahView(this.surahNumber);

  @override
  Widget build(BuildContext context) {
    // Fetch ayahs for the specified surah number
    // Replace this with your actual logic to fetch ayahs
    List<String> ayahs = getAyahsForSurah(surahNumber);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ayahs of Surah $surahNumber'),
      ),
      body: ListView.builder(
        itemCount: ayahs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ayahs[index]),
          );
        },
      ),
    );
  }
}

// Mock function, replace this with your actual logic to fetch ayahs
List<String> getAyahsForSurah(int surahNumber) {
  // Replace this with your actual logic to fetch ayahs
  return List.generate(
      10, (index) => 'Ayah ${index + 1} of Surah $surahNumber');
}
