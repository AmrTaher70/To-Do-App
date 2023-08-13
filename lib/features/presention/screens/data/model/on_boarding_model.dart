import '../../../../../core/app,strings.dart';
import '../../../../../core/app.assets.dart';

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
