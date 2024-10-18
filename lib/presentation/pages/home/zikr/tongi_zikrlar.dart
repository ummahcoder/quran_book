import 'package:flutter/material.dart';
import 'package:quran_book/presentation/pages/home/zikr/tongi_zikr_detail.dart';
import '../../../styles/colors.dart';
import '../view_model/list_of_images.dart';
import '../view_model/zikr_names.dart';
import '../view_model/zikr_texts.dart';

class TongiZikrlar extends StatelessWidget {
  const TongiZikrlar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Tonggi zikrlar",
          style: TextStyle(
              color: AppColors.c_672cbc,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: tongiZikrlar.length,
                        itemBuilder: (context, index) {
                          final key = tongiZikr.keys.elementAt(index);

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    final zikrKey =
                                        tongiZikr.keys.elementAt(index);
                                    final zikrValue = tongiZikr[zikrKey]!;
                                    return TongiZikrDetailsScreen(
                                      zikrName: tongiZikrlar[index],
                                      zikrKey: zikrKey,
                                      zikrValue: zikrValue,
                                      imagePath: tongImages[index],
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(tongImages[index]),
                                  fit: BoxFit.cover,
                                ),
                                //
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.c_9b091,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${index + 1}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          tongiZikrlar[index],
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        key,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
