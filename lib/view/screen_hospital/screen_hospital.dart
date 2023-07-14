import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_hospital/model/model.dart';
import 'package:my_hospital/view/screen_hospital/widget/hospital_widgets.dart';
import '../../utils/colors/colors.dart';

class ScreenHospital extends StatelessWidget {
  const ScreenHospital({
    super.key,
    required this.hospitals,
  });
  final Getdatum hospitals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            goBack(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kBlack,
          ),
        ),
        title: Text(
          hospitals.hospitalname,
          maxLines: 2,
          // overflow: TextOverflow.clip,
          style: const TextStyle(
            fontFamily: "Ubuntu",
            color: kBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: appBarBackground,
        shadowColor: colorTransperant,
        toolbarHeight: 60,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: appBarContainerColor),
          ),
        ),
      ),
      body: BodyOfHospitalScreen(hospitals: hospitals),
    );
  }
}
