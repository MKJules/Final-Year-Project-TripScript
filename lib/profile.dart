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
                child:  ListView(
                  children: const [
                    ListTile(
                      title: Text(
                        'Your Order',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
                      width: 370.w,
                      height: 81.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),)
    );
  }
}
