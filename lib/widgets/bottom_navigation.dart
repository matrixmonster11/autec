// import 'package:autec/ui/earning.dart';
// import 'package:autec/ui/main/main_screen.dart';
import 'package:autec/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigation extends StatelessWidget {
  final int bottomNavigationBarIndex;
  final BuildContext context;

  const BottomNavigation(this.context, this.bottomNavigationBarIndex);

  // void onTabTapped(int index) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute<Null>(builder: (BuildContext context) {
  //      // return (index == 1) ? Earning() : MainScreen();
  //     }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: bottomNavigationBarIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10,
      selectedLabelStyle: TextStyle(color: AppColor.bottomNavSelectedColor),
      selectedItemColor: AppColor.bottomNavSelectedColor,
      unselectedFontSize: 10,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Icon(
              CupertinoIcons.app_badge,
              size: 21,
              color: (bottomNavigationBarIndex == 0)
                  ? AppColor.btnBlueColor
                  : AppColor.lightBlackColor,
            ),
          ),
          label: 'menu_btn_l'.tr,
          backgroundColor: AppColor.lightBlueColor,
        ),
        BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Icon(
                CupertinoIcons.calendar_today,
                size: 21,
                color: (bottomNavigationBarIndex == 0)
                    ? AppColor.btnBlueColor
                    : AppColor.lightBlackColor,
              ),
            ),
            label: "case".tr,
            backgroundColor: AppColor.lightBlackColor),
      ],
     // onTap: onTabTapped,
    );
  }
}
