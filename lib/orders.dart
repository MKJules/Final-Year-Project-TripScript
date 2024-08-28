import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
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
                    'All Trips',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomSearchBar(controller: searchController),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Filter by',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                      const FilterButton(text: 'Date'),
                      const FilterButton(text: 'Trip Type'),
                      const FilterButton(text: 'Price'),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  const TripWidget(),
                  SizedBox(height: 20.h),
                  const TripWidget(),
                  SizedBox(height: 20.h),
                  const TripWidget(),
                  SizedBox(height: 20.h),
                  const TripWidget(),
                  SizedBox(height: 20.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: const Color.fromRGBO(149, 149, 149, 1),
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          icon: SvgPicture.asset(
            'icons/search.svg',
            color: const Color.fromRGBO(149, 149, 149, 1),
            width: 15.w,
            height: 15.h,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 10.sp,
            color: const Color.fromRGBO(149, 149, 149, 1),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.w,
      height: 45.h,
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color.fromRGBO(175, 175, 175, 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black,
            size: 20.sp,
          )
        ],
      ),
    );
  }
}

class TripWidget extends StatelessWidget {
  const TripWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170.h,
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 15.h,
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
          Row(
            children: [
              SvgPicture.asset(
                'icons/bag_tick.svg',
                color: Colors.black,
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(width: 20.w),
              Text(
                '20 Oct 2023',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color.fromRGBO(200, 255, 206, 1),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              SvgPicture.asset(
                'icons/more.svg',
                color: Colors.black,
                height: 18.h,
                width: 18.w,
              ),
            ],
          ),
          const Divider(
            color: Color.fromRGBO(175, 175, 175, 0.7),
          ),
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 65.w,
                height: 65.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(width: 15.w),
              Text(
                'Prau Mountain',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  fixedSize: Size(80.w, 40.h),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'Order Again',
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

