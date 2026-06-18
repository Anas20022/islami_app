import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class MostRecentlyWidget extends StatelessWidget {
  const MostRecentlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: height * 0.02,
      children: [
        Text("Most Recently", style: AppStyles.white16boldJannaLT),
        //todo: ****** don't forget if we need use the ListVew in the Column you must identify the size
        SizedBox(
          height: height * 0.16,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.01,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(width * 0.04),
                ),
                child: Row(
                  spacing: width * 0.01,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: height * 0.01,
                      children: [
                        Text("Al-Anbiya", style: AppStyles.black24boldJannaLT),
                        Text("الأنبياء", style: AppStyles.black24boldJannaLT),
                        Text("112 Verses", style: AppStyles.black14boldJannaLT),
                      ],
                    ),
                    Image.asset(AppAssets.img_most_recent),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: width * 0.02);
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
