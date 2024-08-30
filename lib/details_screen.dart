import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_script/location_webview.dart';
import 'package:trip_script/models/location.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.location});

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationImageWidget(location: location),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoBar(
                      location: location,
                    ),
                    SizedBox(height: 40.h),
                    DescriptionSection(
                      description: location.description,
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LocationWebview(url: 'https://wa.link/fe1xie');
              },
            ),
          );
        },
        backgroundColor: const Color.fromRGBO(0, 176, 60, 1),
        elevation: 4.sp,
        child: SvgPicture.asset(
          'icons/whatsapp.svg',
          width: 30.w,
          height: 30.h,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Container(
        height: 107.h,
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LocationWebview(url: location.websiteLink);
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(26, 142, 234, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                fixedSize: Size(170.w, 56.h),
              ),
              child: Text(
                'Book Now',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationImageWidget extends StatelessWidget {
  const LocationImageWidget({super.key, required this.location});

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          location.images.first,
          height: 501.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Transform.translate(
          offset: Offset(0, 30.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      'icons/back.svg',
                      color: Colors.black,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    'icons/heart.svg',
                    color: Colors.black,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, 400.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location.name,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'icons/location.svg',
                            width: 12.w,
                            height: 12.h,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            location.city,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 60.w,
                  height: 60.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      opacity: 0.6,
                      image: NetworkImage(
                        location.images.last,
                      )
                    ),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Text(
                    '4+',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
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

class InfoBar extends StatelessWidget {
  const InfoBar({super.key, required this.location});

  final Location location;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'RATING',
                  style: TextStyle(
                    color: const Color.fromRGBO(149, 149, 149, 1),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'icons/star.svg',
                      height: 19.h,
                      width: 19.w,
                      color: const Color.fromRGBO(239, 215, 0, 1),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      '${location.rating}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    )
                  ],
                )
              ],
            ),
            VerticalDivider(
              color: const Color.fromRGBO(175, 175, 175, 1),
              width: 1.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'TYPE',
                  style: TextStyle(
                    color: const Color.fromRGBO(149, 149, 149, 1),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Open Trip',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                )
              ],
            ),
            VerticalDivider(
              color: const Color.fromRGBO(175, 175, 175, 1),
              width: 1.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'REGION',
                  style: TextStyle(
                    color: const Color.fromRGBO(149, 149, 149, 1),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${location.region} Region',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
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

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}

class DatePickerSection extends StatelessWidget {
  const DatePickerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Choose date',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SvgPicture.asset(
              'icons/info.svg',
              width: 18.w,
              height: 18.h,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 33.h,
              width: 117.w,
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 9.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  width: 1.w,
                  color: const Color.fromRGBO(175, 175, 175, 1),
                ),
              ),
              child: Text(
                '15 Dec - 20 Dec 2024',
                style: TextStyle(
                  color: const Color.fromRGBO(26, 26, 26, 1),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              height: 33.h,
              width: 117.w,
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 9.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  width: 1.w,
                  color: const Color.fromRGBO(175, 175, 175, 1),
                ),
              ),
              child: Text(
                '25 Dec - 30 Dec 2024',
                style: TextStyle(
                  color: const Color.fromRGBO(26, 26, 26, 1),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              height: 33.h,
              width: 117.w,
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 9.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  width: 1.w,
                  color: const Color.fromRGBO(175, 175, 175, 1),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'icons/calendar.svg',
                    color: const Color.fromRGBO(41, 45, 50, 1),
                    height: 15.h,
                    width: 15.w,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Choose Date',
                    style: TextStyle(
                      color: const Color.fromRGBO(26, 26, 26, 1),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class NumberSelectionSection extends StatelessWidget {
  const NumberSelectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 22.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          width: 1.w,
          color: const Color.fromRGBO(175, 175, 175, 1),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Number of pax',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$80',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '/pax',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            'icons/minus.svg',
            width: 24.w,
            height: 24.h,
            color: Colors.black,
          ),
          SizedBox(width: 15.w),
          Text(
            '1',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(width: 15.w),
          SvgPicture.asset(
            'icons/add.svg',
            width: 24.w,
            height: 24.h,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
