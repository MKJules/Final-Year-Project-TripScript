import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntroWidget(searchController: searchController),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: const DoubleHeader(
                title: 'Popular Nearby',
                onTap: null,
              ),
            ),
            SizedBox(
              height: 300.h,
              child: ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.only(left: 30.w, top: 20.h),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/details');  // Navigate to DetailsPage
                    },
                    child: const PopularLocationWidget(),
                  );
                  // return const PopularLocationWidget();
                },
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: const DoubleHeader(
                title: 'Recommended',
                onTap: null,
              ),
            ),
            SizedBox(
              height: 450.h,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                padding: EdgeInsets.only(left: 30.w, top: 20.h, right: 30.w),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return const RecommendedLocationWidget();
                },
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: const DoubleHeader(
                title: 'Nearest to you',
                onTap: null,
              ),
            ),
            SizedBox(
              height: 270.h,
              child: ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.only(left: 30.w, top: 20.h),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const NearestLocationWidget();
                },
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: const DoubleHeader(
                title: 'Choose the location you want',
                onTap: null,
              ),
            ),
            SizedBox(
              height: 236.h,
              child: ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.only(left: 30.w, top: 20.h),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const LocationWidget();
                },
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: const DoubleHeader(
                title: 'Article',
                onTap: null,
              ),
            ),
            SizedBox(
              height: 260.h,
              child: ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.only(left: 30.w, top: 20.h),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Container(
                      width: 305.w,
                      height: 260.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(175, 175, 175, 1),
                        ),
                        borderRadius: BorderRadius.circular(20.r)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 135.h,
                            child: const Placeholder(),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Article Title',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Article Author',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  '3 Aug 2024',
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 200.h),
          ],
        ),
      ),
    );
  }
}

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.w, 65.h, 30.w, 40.h),
      child: SizedBox(
        width: double.infinity,
        height: 111.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Location',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      'KNUST, Kumasi',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(
                  'icons/discount.svg',
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(width: 20.w),
                SvgPicture.asset(
                  'icons/setting.svg',
                  width: 30.w,
                  height: 30.h,
                ),
              ],
            ),
            Container(
              height: 45.h,
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(
                  color: const Color.fromRGBO(149, 149, 149, 1),
                ),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 10.sp,
                    color: const Color.fromRGBO(149, 149, 149, 1),
                  ),
                  icon: SvgPicture.asset(
                    'icons/search.svg',
                    width: 15.w,
                    height: 15.h,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoubleHeader extends StatelessWidget {
  const DoubleHeader({super.key, this.onTap, required this.title});

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          softWrap: true,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'See all',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}

class PopularImageWidget extends StatelessWidget {
  const PopularImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 195.h,
          width: 232.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: const Placeholder(),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Transform.translate(
            offset: Offset(18.w, 18.h),
            child: Container(
              height: 21.h,
              width: 65.w,
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 3.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                'Category',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PopularLocationWidget extends StatelessWidget {
  const PopularLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        width: 240.w,
        height: 300.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: const Color.fromRGBO(175, 175, 175, 1),
          ),
        ),
        child: Column(
          children: [
            const PopularImageWidget(),
            SizedBox(height: 10.h),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location Name',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'icons/location.svg',
                          width: 12.w,
                          height: 12.h,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Brunei Complex, KNUST',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10.sp,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(
                  'icons/star.svg',
                  width: 16.w,
                  height: 16.h,
                ),
                SizedBox(width: 5.w),
                Text(
                  '4.5',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
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

class RecommendedLocationWidget extends StatelessWidget {
  const RecommendedLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        width: double.infinity,
        height: 95.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: const Color.fromRGBO(175, 175, 175, 1),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Container(
                width: 74.w,
                height: 81.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: const Placeholder(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Location Name',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    width: 65.w,
                    height: 21.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        color: const Color.fromRGBO(175, 175, 175, 1),
                        width: 0.5.w,
                      ),
                    ),
                    child: Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'icons/location.svg',
                        width: 12.w,
                        height: 12.h,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Brunei Complex, KNUST',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(width: 50.w),
                      SvgPicture.asset(
                        'icons/star.svg',
                        width: 16.w,
                        height: 16.h,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NearestImageWidget extends StatelessWidget {
  const NearestImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 167.h,
            width: 167.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: const Placeholder(),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Transform.translate(
            offset: Offset(18.w, 18.h),
            child: Row(
              children: [
                Container(
                  height: 21.h,
                  width: 65.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    'Category',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                SvgPicture.asset(
                  'icons/star.svg',
                  width: 16.w,
                  height: 16.h,
                ),
                SizedBox(width: 5.w),
                Text(
                  '4.5',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class NearestLocationWidget extends StatelessWidget {
  const NearestLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Container(
        width: 175.w,
        height: 270.h,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
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
            const NearestImageWidget(),
            SizedBox(height: 10.h),
            Text(
              'Location Name',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SvgPicture.asset(
                  'icons/location.svg',
                  width: 12.w,
                  height: 12.h,
                ),
                SizedBox(width: 10.w),
                Text(
                  'Brunei Complex, KNUST',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 10.sp,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 236.h,
            width: 175.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.blueGrey,
            ),
          ),
          Text(
            'City Name',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
