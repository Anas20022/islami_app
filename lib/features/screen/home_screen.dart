import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/features/screen/tabs/TimeScreen.dart';
import 'package:islami_app/features/screen/tabs/hadeth_screen.dart';
import 'package:islami_app/features/screen/tabs/quran/quran_screen.dart';
import 'package:islami_app/features/screen/tabs/radio_screen.dart';
import 'package:islami_app/features/screen/tabs/sebha_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> navBarTabs = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];

  List<String> bgImage = [
    AppAssets.quranBg,
    AppAssets.hadithBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Image.asset(
          bgImage[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.transparentColor,
            body: Column(
              spacing: height * 0.02,
              children: [
                Image.asset(AppAssets.logo, width: double.infinity),
                Expanded(child: navBarTabs[selectedIndex]),
              ],
            ),
            // todo: the the other solution use the (Theme Widget) on the BottomNavigationBar add have extra extinction
            bottomNavigationBar: Theme(
              data: Theme.of(
                context,
              ).copyWith(canvasColor: AppColors.primaryColor),
              child: BottomNavigationBar(
                //todo: use the if the items > 3  , we use two solution to appear the color backgroundColor ## this 1 of them
                // type: BottomNavigationBarType.fixed,
                // backgroundColor: AppColors.primaryColor,
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                // iconSize: 26,
                items: [
                  bottomNavigationBarItem(
                    index: 0,
                    icon: AppAssets.quranIcon,
                    label: "Quran",
                  ),
                  bottomNavigationBarItem(
                    index: 1,
                    icon: AppAssets.hadithIcon,
                    label: "Hadith",
                  ),
                  bottomNavigationBarItem(
                    index: 2,
                    icon: AppAssets.sebhaIcon,
                    label: "Sebha",
                  ),
                  bottomNavigationBarItem(
                    index: 3,
                    icon: AppAssets.radioIcon,
                    label: "Radio",
                  ),
                  bottomNavigationBarItem(
                    index: 4,
                    icon: AppAssets.timeIcon,
                    label: "Time",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem({
    required int index,
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: bottomNavBarIcon(icon, index),
      label: label,
    );
  }

  Widget bottomNavBarIcon(String icon, int index) {
    return selectedIndex == index
        ? Container(
            width: 59,
            height: 34,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: AppColors.shadow01)],
            ),
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                AppColors.whiteColor,
                BlendMode.srcIn,
              ),
            ),
          )
        : SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              AppColors.blackColor,
              BlendMode.srcIn,
            ),
          );
  }
}
