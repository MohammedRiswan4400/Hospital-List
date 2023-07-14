import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../utils/colors/colors.dart';
import '../../../model/model.dart';
import '../../../utils/constant/const.dart';

class ContentOfHospitalScreen extends StatelessWidget {
  const ContentOfHospitalScreen({
    super.key,
    required this.content,
  });
  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        fontFamily: kFontFamily,
        wordSpacing: 1,
        fontSize: 14,
      ),
    );
  }
}

class HospitalDivider extends StatelessWidget {
  const HospitalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: kBlack,
      thickness: 1,
      indent: 30,
      endIndent: 30,
    );
  }
}

class TitleOfScreenHospital extends StatelessWidget {
  const TitleOfScreenHospital({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: kFontFamily,
      ),
    );
  }
}

void goBack(context) {
  Navigator.of(context).pop();
}

class BodyOfHospitalScreen extends StatelessWidget {
  const BodyOfHospitalScreen({
    super.key,
    required this.hospitals,
  });

  final Getdatum hospitals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        // top: 10,
      ),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kMainContainer,
                ),
                height: 400,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/hospital2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 75, 169, 255),
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                      // height: 30,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            "Phn : ${hospitals.primaryContactno}",
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontFamily: kFontFamily,
                            ),
                          ),
                        ),
                      ),
                      // width: double.infinity,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const TitleOfScreenHospital(title: "About Us"),
          const SizedBox(
            height: 5,
          ),
          // ContentOfHospitalScreen(content: hospitals.abouthospital),
          HtmlWidget(hospitals.abouthospital),
          const SizedBox(
            height: 5,
          ),
          const HospitalDivider(),
          const TitleOfScreenHospital(
            title: "Hospital features",
          ),
          const SizedBox(
            height: 5,
          ),
          HtmlWidget(hospitals.hospitalfeatures),
          const SizedBox(
            height: 5,
          ),
          const HospitalDivider(),
          const TitleOfScreenHospital(title: "Save with Offers"),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: hospitals.offerdata.length,
            itemBuilder: (context, index) {
              final hospitalOffers = hospitals.offerdata[index];
              final percent = double.tryParse(
                hospitalOffers.percentage,
              );
              final per = (percent ?? 0).toInt();
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      radius: 15,
                      child: Center(
                        child: Text(
                          "$per%",
                          style: const TextStyle(
                              fontSize: 14,
                              color: kWhite,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Text(
                        hospitalOffers.title,
                        maxLines: 2,
                        style: const TextStyle(
                          fontFamily: kFontFamily,
                          wordSpacing: 1,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    // CircleAvatar()
                  ],
                ),
              );
            },
          ),
          const HospitalDivider(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: kMainContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: TitleOfScreenHospital(title: "Address")),
                    const SizedBox(
                      height: 5,
                    ),
                    ContentOfHospitalScreen(content: hospitals.hospitaladdress),
                    const SizedBox(
                      height: 5,
                    ),
                    ContentOfHospitalScreen(
                        content: "Pincode : ${hospitals.pincode}"),
                    const HospitalDivider(),
                    const SizedBox(
                      height: 5,
                    ),
                    const Center(
                        child: TitleOfScreenHospital(title: "Contact us")),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: ContentOfHospitalScreen(
                        content: "Phone no : ${hospitals.primaryContactno}",
                      ),
                    ),
                    Center(
                      child: ContentOfHospitalScreen(
                        content: "Phone no : ${hospitals.secondaryContactno}",
                      ),
                    ),
                    Center(
                      child: ContentOfHospitalScreen(
                        content: "Mobile no : ${hospitals.mobileno}",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],

        // return Center(child: CircularProgressIndicator());
      ),
    );
  }
}
