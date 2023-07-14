import 'package:flutter/material.dart';

import '../../../utils/colors/colors.dart';
import '../../../model/model.dart';
import '../../../utils/constant/const.dart';
import '../../screen_hospital/screen_hospital.dart';

class MainContainerContact extends StatelessWidget {
  const MainContainerContact({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleOfTheMainContainer(title: title),
        Text(
          subTitle,
        )
      ],
    );
  }
}

class TitleOfTheMainContainer extends StatelessWidget {
  const TitleOfTheMainContainer({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: kFontFamily,
      ),
    );
  }
}

void gotoScreenHospital(
    {required BuildContext context, required Getdatum hospitals}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return ScreenHospital(
        hospitals: hospitals,
      );
    },
  ));
}
