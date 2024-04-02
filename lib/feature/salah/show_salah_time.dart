import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_book/core/style/images/images.dart';

import '../../core/services/get_salah_data.dart';
import '../../data/entity/salah_time_model.dart';

class ShowSalahTime extends StatelessWidget {
  const ShowSalahTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/masjid.jpg",
            fit: BoxFit.cover,
          ),
          FutureBuilder(
            future: GetSalahDataService().fetchNamozVaqtlari(
                "https://islomapi.uz/api/present/day?region=Toshkent"),
            builder: (context, AsyncSnapshot<NamozVaqtlari> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                final namozVaqtlari = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.go("/homePage");
                            },
                            icon: Image.asset(
                              "assets/images/return.png",
                              width: 24,
                              height: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildText('Yakshanba', 15),
                              _buildText('21 Ramazon, 1445', 15),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 120),
                      _buildPrayerTimeContainer(namozVaqtlari),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildText(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: Colors.white),
    );
  }

  Widget _buildPrayerTimeContainer(NamozVaqtlari namozVaqtlari) {
    return Center(
      child: Container(
        width: 280,
        height: 360,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPrayerTimeColumn(
                    ['Bomdod', 'Quyosh', 'Peshin', 'Asr', 'Shom', 'Xufton']),
                _buildPrayerTimeColumn([
                  namozVaqtlari.times.tongSaharlik,
                  namozVaqtlari.times.quyosh,
                  namozVaqtlari.times.peshin,
                  namozVaqtlari.times.asr,
                  namozVaqtlari.times.shomIftor,
                  namozVaqtlari.times.hufton
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrayerTimeColumn(List<String> prayerTimes) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: prayerTimes
          .map((time) => Text(
                time,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ))
          .toList(),
    );
  }
}
