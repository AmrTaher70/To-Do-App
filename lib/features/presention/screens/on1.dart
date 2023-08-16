import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:up_course2/core/widgets/elev_button/elev_button.dart';
import 'package:up_course2/core/widgets/text_button/text_button.dart';

import '../../../core/app,strings.dart';
import '../../../core/app.assets.dart';
import '../../../core/app.colors.dart';
import '../../../core/dataBase/cache_helper.dart';
import '../../../core/dataBase/services/services.locator.dart';
import '../../auth/task/presentation/screens/Home_Screen/home.dart';

class On1 extends StatefulWidget {
  const On1({Key? key}) : super(key: key);

  @override
  State<On1> createState() => _On1State();
}

class _On1State extends State<On1> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.background,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      index != 2
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CostumeTextButton(
                                      text: AppStrings.appSkip,
                                      onPressed: () {
                                        controller.jumpToPage(2);
                                      })),
                            )
                          : const SizedBox(
                              height: 63,
                            ), //skip
                      const SizedBox(
                        height: 48,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Image.asset(
                          OnBoardingModel.onBoardingScreens[index].imgPath,
                          height: 290,
                          width: 290,
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                            activeDotColor: AppColors.primary,
                            dotHeight: 5,
                            spacing: 4),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Text(OnBoardingModel.onBoardingScreens[index].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 40)), //title
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        OnBoardingModel.onBoardingScreens[index].subTitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayMedium,
                      ), //sub
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            const Spacer(),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: index != 2
                                    ? ElevCustomButton(
                                        text: AppStrings.appNext,
                                        onPressed: () {
                                          controller.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 1000),
                                              curve: Curves
                                                  .fastLinearToSlowEaseIn);
                                        },
                                      )
                                    : ElevCustomButton(
                                        text: AppStrings.appGetStarted,
                                        onPressed: () async {
                                          await sl<CacheHelper>()
                                              .saveData(
                                                  key: AppStrings.appOnBoarding,
                                                  value: true)
                                              .then((value) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const Home()));
                                          });
                                        },
                                      )),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingModel {
  final String imgPath;
  final String title;
  final String subTitle;
  OnBoardingModel(
      {required this.imgPath, required this.title, required this.subTitle});
  static List<OnBoardingModel> onBoardingScreens = [
    OnBoardingModel(
        imgPath: AppAssets.on1,
        title: AppStrings.appTitleOn1,
        subTitle: AppStrings.appSubOn1),
    OnBoardingModel(
        imgPath: AppAssets.on2,
        title: AppStrings.appTitleOn2,
        subTitle: AppStrings.appSubOn2),
    OnBoardingModel(
        imgPath: AppAssets.on3,
        title: AppStrings.appTitleOn3,
        subTitle: AppStrings.appSubOn3)
  ];
}
