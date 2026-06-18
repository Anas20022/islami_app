import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../model/sura_list.dart';

class SuraItemWidget extends StatelessWidget {
  int index;

  SuraItemWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(AppAssets.sura_number),
          Text((index + 1).toString(), style: AppStyles.white20boldJannaLT),
        ],
      ),
      title: Text(
        SuraList.englishQuranList[index],
        style: AppStyles.white20boldJannaLT,
      ),
      subtitle: Text(
        "${SuraList.SuraVerse[index]} Verses",
        style: AppStyles.white14boldJannaLT,
      ),
      trailing: Text(
        SuraList.arabicQuranList[index],
        style: AppStyles.white20boldJannaLT,
      ),
    );
  }
}
