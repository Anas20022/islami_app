import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/screen/tabs/quran/widgets/most_recently_widget.dart';
import 'package:islami_app/features/screen/tabs/quran/widgets/sura_item_widget.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              textSelectionTheme: TextSelectionThemeData(
                selectionColor: AppColors.selectionColor,
                // todo: لون خلفية النص المحدد (بدل البنفسجي)
                selectionHandleColor: AppColors
                    .primaryColor, // todo:  لون المقابض التي تظهر عند التحديد
              ),
            ),
            child: TextFormField(
              style: AppStyles.white16boldJannaLT,
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: width * 0.04),
                hintText: "Sura Name",
                hintStyle: AppStyles.white16boldJannaLT,
                prefixIcon: SvgPicture.asset(
                  AppAssets.iconSearch,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                focusedBorder: buildDecorationBorder(width),
                enabledBorder: buildDecorationBorder(width),
                fillColor: AppColors.primaryColor,
                focusColor: AppColors.primaryColor,
              ),
            ),
          ),
          MostRecentlyWidget(),

          Text("Suras List", style: AppStyles.white16boldJannaLT),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed(AppRoutes.suraDetailsScreen, arguments: index);
                  },
                  child: SuraItemWidget(index: index),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  indent: width * 0.14,
                  endIndent: width * 0.14,
                );
              },
              itemCount: 114,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildDecorationBorder(double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(width * 0.03),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }
}
