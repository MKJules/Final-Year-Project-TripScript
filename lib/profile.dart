import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                SvgPicture.asset(
                  'icons/back.svg',
                  color: Colors.white,
                  width: 24.w,
                  height: 24.h,
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
            SizedBox(height: 90.h),
            Stack(
              children: [
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
                      vertical: 72.h,
                    ),
                    children: [
                      const ProfileListTile(
                        title: 'Your Orders',
                        subtitle:
                            'View your order and transaction history here',
                        canExpand: true,
                      ),
                      SizedBox(height: 20.h),
                      const ProfileListTile(
                        title: 'Payment Method',
                        subtitle:
                            'Save your preferred payment method for smoother transactions',
                        canExpand: true,
                      ),
                      SizedBox(height: 20.h),
                      const ProfileListTile(
                        title: 'Coupons & Vouchers',
                        subtitle:
                            'Claim vouchers and discounts for reduced prices or free shipping',
                        canExpand: true,
                      ),
                      SizedBox(height: 20.h),
                      const ProfileListTile(
                        title: 'Support Center',
                        subtitle: 'Find the best answer to your question',
                        canExpand: true,
                      ),
                      SizedBox(height: 20.h),
                      const ProfileListTile(
                        title: 'Settings',
                        subtitle: 'View and set your account preferences',
                        canExpand: false,
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -50.h),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Material(
                      borderRadius: BorderRadius.circular(10.r),
                      elevation: 5,
                      child: Container(
                        alignment: Alignment.center,
                        width: 370.w,
                        height: 81.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: ListTile(
                          leading: ClipOval(
                            child: Image.asset(
                              'images/user.jpeg',
                              width: 43.w,
                              height: 43.h,
                            ),
                          ),
                          title: Text(
                            'Julian',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 10.sp,
                              color: const Color.fromRGBO(112, 112, 112, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.canExpand,
  });

  final String title;
  final String subtitle;
  final bool canExpand;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 19.w,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color.fromRGBO(175, 175, 175, 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          canExpand
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                )
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          SizedBox(height: 15.h),
          SizedBox(
            width: 215.w,
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w300,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
