import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/sura_list.dart';

class SuraDetailsScreen extends StatelessWidget {
  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SuraList.englishQuranList[index],
          style: AppStyles.primary20boldJannaLT,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.img_left_corner),
                Text(
                  SuraList.arabicQuranList[index],
                  style: AppStyles.primary24boldJannaLT,
                ),
                Image.asset(AppAssets.img_right_corner),
              ],
            ),
          ),
          Expanded(child: Container(color: AppColors.primaryColor)),
          Image.asset(AppAssets.img_bottom_decoration),
        ],
      ),
    );
  }
}
