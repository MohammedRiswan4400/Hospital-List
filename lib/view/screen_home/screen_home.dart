import 'package:flutter/material.dart';
import 'package:my_hospital/utils/colors/colors.dart';
import 'package:my_hospital/model/model.dart';
import 'package:my_hospital/controller/network_helper.dart';
import 'package:my_hospital/view/screen_home/widgets/home_widgets.dart';

import '../../utils/constant/const.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    String greeting;
    if (now.hour < 12) {
      greeting = "Good Morning";
    } else if (now.hour < 17) {
      greeting = "Good Afternoon";
    } else {
      greeting = "Good Night";
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Text(
                    "My Hospitals",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: kFontFamily,
                    ),
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    greeting,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: kFontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ),
          FutureBuilder(
            future: NetworkHelper.fetchDataFromApi(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                const Center(child: Text("Somthing Went Wrong"));
              } else if (snapshot.hasData) {
                final datas = snapshot.data;
                final datasLength = datas!.getdata.length;

                return Expanded(
                  flex: 12,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: datasLength,
                    itemBuilder: (context, index) {
                      final hospitalDatas = datas.getdata[index];
                      //  final imageUrl = datas.imageurl;
                      // final hospitalImages =
                      //     imageUrl + hospitalDatas.hospitalimage;
                      return buildContainers(context, datas, hospitalDatas);
                    },
                  ),
                );
              }
              return const Expanded(
                  flex: 12, child: Center(child: CircularProgressIndicator()));
            },
          )
        ],
      ),
    );
  }

  Padding buildContainers(
    BuildContext context,
    Hospitals datas,
    Getdatum hospitalDatas,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          gotoScreenHospital(context: context, hospitals: hospitalDatas);
        },
        child: SizedBox(
          // height: 500,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kMainContainer,
                  ),
                  // height: 400,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: Colors.red,
                              ),
                              height: 220,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  // datas.imageurl,
                                  // datas.imageurl + hospitalDatas.hospitalimage,
                                  "assets/hospital.jpg",
                                  // hospitalImages,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 10,
                              child: Row(
                                // crossAxisAlignment:
                                //     CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: hospitalNameGradient,
                                        border: Border.all(
                                          width: 1,
                                        ),
                                      ),
                                      // height: 30,
                                      width: 250,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Text(
                                            hospitalDatas.hospitalname,
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: kFontFamily,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // width: double.infinity,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TitleOfTheMainContainer(title: "Hospital Offers"),
                        const SizedBox(
                          height: 5,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: hospitalDatas.offerdata.length,
                          itemBuilder: (context, index) {
                            final hospitalOffrs =
                                hospitalDatas.offerdata[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: 5,
                              ),
                              child: Text(
                                hospitalOffrs.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  // fontWeight:,
                                  fontFamily: kFontFamily,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const TitleOfTheMainContainer(
                          title: 'Address',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          hospitalDatas.hospitaladdress,
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: kFontFamily,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MainContainerContact(
                            title: "Contact us :",
                            subTitle:
                                " ${hospitalDatas.primaryContactno} / ${hospitalDatas.secondaryContactno}"),
                        const SizedBox(
                          height: 5,
                        ),
                        MainContainerContact(
                          title: 'Mobile : ',
                          subTitle: hospitalDatas.primaryContactno,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // SizedBox(height: ,)
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                // left: 0,
                right: -7,
                top: -12,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(255, 255, 79, 3),
                    child: Center(
                      child: Text(
                        "20%",
                        style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
