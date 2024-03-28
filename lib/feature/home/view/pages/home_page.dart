import 'package:flutter/material.dart';
import 'package:quran_book/core/style/colors.dart';
import 'package:quran_book/core/style/images/images.dart';
import 'package:quran/quran.dart' as quran;

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
    return Scaffold(
      appBar: AppBar(
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
                height: 24,
              ),
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: "Surah"),
                  Tab(text: "Para"),
                  Tab(text: "Page"),
                  Tab(text: "Hijb"),
                ],
              ),
              // TabBarView(children: [
              //   Column(
              //     children: [],
              //   )
              // ])
            ],
          ),
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
              icon: Image.asset(
                AppImages.prayer,
                scale: 4,
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
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
