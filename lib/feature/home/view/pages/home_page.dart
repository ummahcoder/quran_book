import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:quran/quran.dart';
import 'package:quran/quran_text.dart';
import 'package:quran_book/core/style/colors.dart';
import 'package:quran_book/core/style/images/images.dart';
import 'package:quran_book/feature/home/view/pages/surah_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.appbarMenu,
                    scale: 3,
                  ),
                  const SizedBox(
                    width: 23,
                  ),
                  Text(
                    "Quran App",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.c_672cbc,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset(
                  AppImages.appBarSearch,
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Assalamu alaykum",
                      style: TextStyle(fontSize: 18, color: AppColors.c_8789a3),
                    ),
                    Text(
                      "User Name",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.c_240F4F),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      AppImages.linearContainer,
                      width: MediaQuery.of(context).size.width - 48,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TabBar(
                      indicatorColor: AppColors.c_672cbc,
                      controller: _tabController,
                      tabs: const [
                        Tab(text: "Surah"),
                        Tab(text: "Para"),
                        Tab(text: "Page"),
                        Tab(text: "Hijb"),
                      ],
                    ),
                    SizedBox(
                      height: 550,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 114,
                        itemBuilder: (context, index) {
                          int surahNumber = index + 1;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SurahView(surahNumber),
                                ),
                              );
                            },
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Stack(
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/images/surah_number.png",
                                              height: 36,
                                              width: 36,
                                            ),
                                            Positioned(
                                              left: 0,
                                              right: 0,
                                              top: 0,
                                              bottom: 0,
                                              child: Center(
                                                child: Text(
                                                  surahNumber.toString(),
                                                  style: TextStyle(
                                                    color: AppColors.c_240F4F,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getSurahName(surahNumber),
                                              style: TextStyle(
                                                  color: AppColors.c_240F4F,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            Text(
                                              "${getPlaceOfRevelation(surahNumber).toUpperCase()} ${getVerseCount(surahNumber).toString()} verses"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  color: AppColors.c_8789a3,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      getSurahNameArabic(surahNumber),
                                      style: TextStyle(
                                          color: AppColors.c_863ED5,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.tajweed,
                    scale: 4,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.light,
                    scale: 4,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: GestureDetector(
                    onTap: () {
                      context.goNamed("showSalahTime");
                    },
                    child: Image.asset(
                      AppImages.prayer,
                      scale: 4,
                    ),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.dua,
                    scale: 4,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.save,
                    scale: 4,
                  ),
                  label: "")
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
