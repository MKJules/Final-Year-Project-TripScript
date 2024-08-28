import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'icons/back.svg',
                    color: Colors.white,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              height: 800.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.r),
                  topRight: Radius.circular(50.r),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 40.h,
                ),
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const SettingsListTile(
                    iconPath: 'icons/account.svg',
                    title: 'Account',
                  ),
                  SizedBox(height: 10.h),
                  const SettingsListTile(
                    iconPath: 'icons/password.svg',
                    title: 'Password',
                  ),
                  SizedBox(height: 10.h),
                  const SettingsListTile(
                    iconPath: 'icons/security.svg',
                    title: 'Security',
                  ),
                  SizedBox(height: 40.h),
                  const SettingsListTile(
                    iconPath: 'icons/notification.svg',
                    title: 'Notifications',
                  ),
                  SizedBox(height: 10.h),
                  const SettingsListTile(
                    iconPath: 'icons/location.svg',
                    title: 'Location',
                  ),
                  SizedBox(height: 40.h),
                  const SettingsListTile(
                    iconPath: 'icons/sign_out.svg',
                    title: 'Sign Out',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.iconPath,
    required this.title,
  });

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color.fromRGBO(175, 175, 175, 1),
        ),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          iconPath,
          height: 24.h,
          width: 24.w,
          color: const Color.fromRGBO(26, 26, 26, 1),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: const Color.fromRGBO(26, 26, 26, 1),
          size: 20.sp,
        ),
      ),
    );
  }
}
