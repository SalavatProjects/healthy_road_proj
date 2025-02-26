import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_road_proj/pages/bottom_nav_bar_screen.dart';
import 'package:healthy_road_proj/ui_kit/app_colors.dart';
import 'package:healthy_road_proj/ui_kit/app_styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.darkBlueGray,
            AppColors.darkGray
          ])
        ),
        child: Stack(
          children: [
            SafeArea(
                child: Padding(
                    padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      Image.asset('assets/images/healthy road transparent.png', width: 260.w, fit: BoxFit.fitWidth,),
                      SizedBox(height: 32.w,),
                      Text('Your Path to a Better You', style: AppStyles.quicksandW600White(26.sp),),
                      SizedBox(height: 12.w,),
                      SizedBox(
                        width: 280.w,
                        child: Text(
                            'Work out, play games, and track your progress—all in one convenient app!',
                            style: AppStyles.quicksandW400Gray(20.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),



                    ],
                  ),
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/cubes.png')),
            Align(
              alignment: Alignment(0, 0.95),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: CupertinoButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => BottomNavBarScreen())
                  ),
                  padding: EdgeInsets.zero,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 54.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.r),
                        color: AppColors.white
                    ),
                    child: Center(
                      child: Text('Start', style: AppStyles.quicksandW600Black(20.sp),),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
