import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_script/orders.dart';

class SupportCenter extends StatefulWidget {
  const SupportCenter({super.key});

  @override
  State<SupportCenter> createState() => _SupportCenterState();
}

class _SupportCenterState extends State<SupportCenter> {
  final TextEditingController searchController = TextEditingController();

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
                    'Hi Julian, how can we help?',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomSearchBar(controller: searchController),
                  SizedBox(height: 20.h),
                  Container(
                    height: 170.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 20.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: const Color.fromRGBO(175, 175, 175, 1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Complaint List',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'images/complaints.svg',
                              height: 80.h,
                              width: 110.w,
                            ),
                            SizedBox(width: 50.w),
                            Expanded(
                              child: Text(
                                'All your complaints, questions, or submissions to Customer Care can be seen in the Complaint List.',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                                softWrap: true,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'Select help topic',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 270.h,
                    child: GridView(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20.h,
                      ),
                      children: const [
                        HelpTopicWidget(
                          asset: 'images/general.svg',
                          title: 'General',
                        ),
                        HelpTopicWidget(
                          asset: 'images/account.svg',
                          title: 'Account',
                        ),
                        HelpTopicWidget(
                          asset: 'images/order.svg',
                          title: 'Order',
                        ),
                        HelpTopicWidget(
                          asset: 'images/payment.svg',
                          title: 'Payment',
                        ),
                        HelpTopicWidget(
                          asset: 'images/canceled.svg',
                          title: 'Canceled',
                        ),
                        HelpTopicWidget(
                          asset: 'images/change.svg',
                          title: 'Change',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpTopicWidget extends StatelessWidget {
  const HelpTopicWidget({
    super.key,
    required this.asset,
    required this.title,
  });

  final String asset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 110.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            elevation: 5.7,
            borderRadius: BorderRadius.circular(5.r),
            child: Container(
              height: 80.h,
              width: 80.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Colors.white,
              ),
              child: SvgPicture.asset(
                asset,
                height: 40.h,
                width: 60.w,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
