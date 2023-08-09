import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:up_course2/core/app,strings.dart';
import 'package:up_course2/core/app.assets.dart';
import 'package:up_course2/core/app.colors.dart'; // Corrected import path
import 'package:google_fonts/google_fonts.dart';

class On2 extends StatefulWidget {
  On2({Key? key}) : super(key: key); // Fixed super.key to key parameter

  @override
  State<On2> createState() => _On2State();
}

class _On2State extends State<On2> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              //page view
              child: PageView.builder(
                controller: controller,
                itemCount: 3,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              AppStrings.appSkip,
                              style: GoogleFonts.lato(
                                color: AppColors.white.withOpacity(0.44),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ), //skip
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Image.asset(
                          AppAssets.on2,
                          height: 300,
                          width: 300,
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            activeDotColor: AppColors.primary,
                            dotHeight: 5,
                            spacing: 4
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'You can easily manage all of your daily tasks in DoMe for free',
                        style: GoogleFonts.lato(
                          color: AppColors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ), //title
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        AppStrings.appSubOn2,
                        style: GoogleFonts.lato(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ), //sub
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  );
                },
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          )),
                      child: Text(AppStrings.appNext),
                    ),
                  ),
                ],
              ),
            ), //next
          ],
        ),
      ),
    );
  }
}
