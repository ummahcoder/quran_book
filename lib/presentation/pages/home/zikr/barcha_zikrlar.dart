// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../styles/colors.dart';
import '../view_model/list_of_images.dart';
import '../view_model/zikr_names.dart';
import '../view_model/zikr_texts.dart';
import 'zikr_detail.dart';

class BarchaZikrlar extends StatelessWidget {
  const BarchaZikrlar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        surfaceTintColor: Colors.white,
        title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Barcha Zikr",
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.c_672cbc,
                  fontWeight: FontWeight.bold),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: zikrNames.length,
                  itemBuilder: (context, index) {
                    final key = zikrs.keys.elementAt(index);
                    // final randomPicIndex = index % randomPics.length;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              final zikrKey = zikrs.keys.elementAt(index);
                              final zikrValue = zikrs[zikrKey]!;
                              return ZikrDetailsScreen(
                                zikrName: zikrNames[index],
                                zikrKey: zikrKey,
                                zikrValue: zikrValue,
                                imagePath: randomPics[index],
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(randomPics[index]),
                            fit: BoxFit.cover,
                          ),
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
                                    zikrNames[index],
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
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
    );
  }
}
