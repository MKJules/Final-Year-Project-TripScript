import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
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
          SizedBox(height: 20.h),
          Container(
            width: double.infinity,
            height: 750.h,
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 42.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r),
                topRight: Radius.circular(50.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                const NotificationWidget(
                  title: 'Discount 20% from GOPAY!',
                  subtitle: 'By using GOPAY payment during your transaction, you get up to 20% discount!',
                ),
                SizedBox(height: 20.h),
                Text(
                  'Earlier',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                const NotificationWidget(
                  title: 'Cashback 20% from DANA!',
                  subtitle: 'Get 20% DANA Cashback, if you spend more than \$50 on anything.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(125, 125, 125, 1),
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'icons/discount.svg',
                color: Colors.black,
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(width: 10.w),
              Text(
                'Promo',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 10.sp,
                ),
              ),
              const Spacer(),
              Text(
                '19 Jan 2024',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Spacer(),
          Container(
            height: 65.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 174, 214, 1),
              borderRadius: BorderRadius.circular(10.r),
            ),
          )
        ],
      ),
    );
  }
}
