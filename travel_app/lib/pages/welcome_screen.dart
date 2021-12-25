import 'package:flutter/material.dart';
import 'package:travel_app/layout/layout.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/misc/constants.dart';
import 'package:travel_app/misc/global_functions.dart';
import 'package:travel_app/network/cache_helper.dart';
import 'package:travel_app/pages/nav_pages/main_page.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomeScreen extends StatelessWidget {
  List<String> images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin:
                    const EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: 'Trips'),
                        AppText(
                          text: 'Mountain',
                          size: 30.0,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 250.0,
                          child: AppText(
                            text:
                                "Mountain hikes give you incredible sense of freedom along with enduran test",
                            color: AppColors.textColor2,
                            size: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        InkWell(
                          onTap: () {
                            isSkipped = true;
                            CacheHelper.saveData(
                                key: 'skipped', value: isSkipped);
                            navigateAndFinish(context, const TravelLayout());
                          },
                          child: ResponsaveButton(
                            width: 120.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                            margin: const EdgeInsets.only(
                              bottom: 2.0,
                            ),
                            width: 8.0,
                            height: index == indexDots ? 25.0 : 8.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: index == indexDots
                                    ? AppColors.mainColor
                                    : AppColors.mainColor.withOpacity(0.3)));
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
