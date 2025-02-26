import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blur/blur.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_road_proj/pages/home_page.dart';

import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';
import '../utils/constants.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentPage = 0;

  final List<Widget> _pages = [
    HomePage(),
    Placeholder(),
    Placeholder(),
    Placeholder()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.darkBlueGray,
                  AppColors.darkGray
                ])
            ),
          ),
          SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/healthy road sign.png', width: 180.w,),
                        CupertinoButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: Container(
                            width: 52.w,
                            height: 52.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightBlack.withValues(alpha: 0.25)
                            ),
                            child: Center(
                              child: SvgPicture.asset('assets/icons/bell.svg', width: 19.w, fit: BoxFit.fitWidth,),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24.w,),
                    _pages[_currentPage],
                  ],
                ),
              )),
          if (_currentPage == 2)
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/cubes 2.png'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.only(bottom: 24.w),
              child: Blur(
                borderRadius: BorderRadius.circular(32.r),
                overlay: Padding(
                    padding: EdgeInsets.all(6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _BottomNavBarBtn(
                          imagePath: 'assets/icons/home.svg',
                          isSelected: _currentPage == 0,
                          onPressed: () {
                            setState(() {
                              _currentPage = 0;
                            });
                          }),
                      _BottomNavBarBtn(
                          imagePath: 'assets/icons/calender.svg',
                          isSelected: _currentPage == 1,
                          onPressed: () {
                            setState(() {
                              _currentPage = 1;
                            });
                          }),
                      _BottomNavBarBtn(
                          imagePath: 'assets/icons/game.svg',
                          isSelected: _currentPage == 2,
                          onPressed: () {
                            setState(() {
                              _currentPage = 2;
                            });
                          }),
                      _BottomNavBarBtn(
                          imagePath: 'assets/icons/settings.svg',
                          isSelected: _currentPage == 3,
                          onPressed: () {
                            setState(() {
                              _currentPage = 3;
                            });
                          }),
                    ],
                  ),
                ),
                child: Container(
                  width: 230.w,
                  height: 64.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    color: AppColors.black.withValues(alpha: 0.2)
                  ),
                ),),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavBarBtn extends StatelessWidget {
  String imagePath;
  bool isSelected;
  void Function() onPressed;

  _BottomNavBarBtn({
    super.key,
    required this.imagePath,
    this.isSelected = false,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        width: 52.w,
        height: 52.w,
        decoration: isSelected ? BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white
        ) : null,
        child: Center(
          child: SvgPicture.asset(
            imagePath,
            colorFilter: ColorFilter.mode(isSelected ? AppColors.black : AppColors.white, BlendMode.srcIn),
            width: 18.w,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}