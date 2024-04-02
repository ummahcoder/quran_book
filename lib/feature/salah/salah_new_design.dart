import 'package:flutter/material.dart';
import '../../core/services/get_salah_data.dart';
import '../../data/entity/salah_time_model.dart';
import 'package:lottie/lottie.dart';

class SalahNew extends StatelessWidget {
  const SalahNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Seshanba",
              style: TextStyle(color: Color(0xFF6F6868), fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "21 Ramazon, 1445",
              style: TextStyle(color: Color(0xFF6F6868), fontSize: 16),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/salah_bcg.png",
                  scale: 4,
                ),
                FutureBuilder(
                  future: GetSalahDataService().fetchNamozVaqtlari(
                      "https://islomapi.uz/api/present/day?region=Toshkent"),
                  builder: (context, AsyncSnapshot<NamozVaqtlari> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      final namozVaqtlari = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            _buildPrayerTimeContainer(namozVaqtlari),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Lottie.asset("assets/icons/compass.json",
                      width: 70, height: 70),
                  TextButton(
                      onPressed: () {},
                      child: const Text("Find Qibla",
                          style: TextStyle(
                              color: Color(0xFF6F6868), fontSize: 16)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerTimeContainer(NamozVaqtlari namozVaqtlari) {
    return Padding(
      padding: const EdgeInsets.all(60.0),
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
    );
  }

  Widget _buildPrayerTimeColumn(List<String> prayerTimes) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: prayerTimes
          .map((time) => SizedBox(
                height: 50,
                child: Text(
                  time,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ))
          .toList(),
    );
  }
}
