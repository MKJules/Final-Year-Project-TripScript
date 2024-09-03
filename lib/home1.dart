import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trip_script/consts/snackbar.dart';
import 'package:trip_script/details_screen.dart';
import 'package:trip_script/models/location.dart';
import 'package:trip_script/providers/article_provider.dart';
import 'package:trip_script/providers/location_provider.dart';
import 'package:trip_script/region_locations.dart';
import 'package:trip_script/services/location_services.dart';
import 'package:trip_script/settings.dart';

import 'models/article.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LocationProvider locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    final ArticleProvider articleProvider =
        Provider.of<ArticleProvider>(context, listen: false);
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
              child: FutureBuilder(
                future: locationProvider.fetchNearbyPopularLocations(),
                builder: (context, snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return const SizedBox();
                  } else if (snapshots.hasError) {
                    log('Error: ${snapshots.error}');
                    showCustomSnackbar('Error: ${snapshots.hasError}', context);
                    return const SizedBox();
                  } else if (snapshots.hasData) {
                    List<Location> popularNearby = snapshots.data ?? [];
                    return ListView.builder(
                      itemCount: 2,
                      padding: EdgeInsets.only(left: 30.w, top: 20.h),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Location location = popularNearby[index];
                        return PopularLocationWidget(
                          location: location,
                        );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
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
                height: 550.h,
                child: FutureBuilder(
                  future: locationProvider.fetchRecommendedLocations(),
                  builder: (context, snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return const SizedBox();
                    } else if (snapshots.hasError) {
                      log('Error: ${snapshots.error}');
                      showCustomSnackbar(
                          'Error: ${snapshots.hasError}', context);
                      return const SizedBox();
                    } else if (snapshots.hasData) {
                      List<Location> recommendedLocations =
                          snapshots.data ?? [];
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        padding:
                            EdgeInsets.only(left: 30.w, top: 20.h, right: 30.w),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          Location location = recommendedLocations[index];
                          return RecommendedLocationWidget(
                            location: location,
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )),
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
              child: FutureBuilder(
                future: locationProvider.fetchNearbyLocations(),
                builder: (context, snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return const SizedBox();
                  } else if (snapshots.hasData) {
                    List<Location> nearbyLocations = snapshots.data ?? [];
                    return ListView.builder(
                      itemCount: 2,
                      padding: EdgeInsets.only(left: 30.w, top: 20.h),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Location location = nearbyLocations[index];
                        return NearestLocationWidget(
                          location: location,
                        );
                      },
                    );
                  } else if (snapshots.hasError) {
                    log('Error: ${snapshots.error}');
                    return const SizedBox();
                  } else {
                    return const SizedBox();
                  }
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
              child: ListView(
                padding: EdgeInsets.only(left: 30.w, top: 20.h),
                scrollDirection: Axis.horizontal,
                children: const [
                  LocationWidget(
                    city: 'Ashanti Region',
                    region: 'Ashanti',
                    asset: 'images/kumasi.jpg',
                  ),
                  LocationWidget(
                    city: 'Greater Accra',
                    region: 'Greater Accra',
                    asset: 'images/accra.jpg',
                  ),
                ],
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
              child: FutureBuilder(
                future: articleProvider.fetchArticles(),
                builder: (context, snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return const SizedBox();
                  } else if (snapshots.hasData) {
                    List<Article> articles = snapshots.data ?? [];
                    return ListView.builder(
                      itemCount: 2,
                      padding: EdgeInsets.only(left: 30.w, top: 20.h),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Article article = articles[index];
                        return ArticleWidget(article: article);
                      },
                    );
                  } else if (snapshots.hasError) {
                    log('Error: ${snapshots.error}');
                    return const SizedBox();
                  } else {
                    return const SizedBox();
                  }
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

class IntroWidget extends StatefulWidget {
  const IntroWidget({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  State<IntroWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  String? cityName;

  void getCityName() async {
    String? name = await LocationService.getCity();

    setState(() {
      cityName = name;
    });
  }

  @override
  void initState() {
    super.initState();
    getCityName();
  }

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
                      cityName ?? 'Loading...',
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Settings();
                        },
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    'icons/setting.svg',
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ],
            ),
            Container(
              height: 45.h,
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(
                  color: const Color.fromRGBO(149, 149, 149, 1),
                ),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: widget.searchController,
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
        Expanded(
          child: Text(
            title,
            softWrap: true,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
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
  const PopularImageWidget({
    super.key,
    required this.imagePath,
    required this.category,
  });

  final String imagePath;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imagePath,
          fit: BoxFit.cover,
          height: 195.h,
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Transform.translate(
            offset: Offset(18.w, 18.h),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 3.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                category,
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
  const PopularLocationWidget({super.key, required this.location});

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DetailsPage(
                  location: location,
                );
              },
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          width: 300.w,
          height: 300.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: const Color.fromRGBO(175, 175, 175, 1),
            ),
          ),
          child: Column(
            children: [
              PopularImageWidget(
                imagePath: location.images.first,
                category: location.category,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location.name,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
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
                            '${location.city}, ${location.region} Region',
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
      ),
    );
  }
}


class RecommendedLocationWidget extends StatelessWidget {
  const RecommendedLocationWidget({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DetailsPage(
                  location: location,
                );
              },
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 120.h,
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
                child: Image.network(
                  location.images.first,
                  fit: BoxFit.cover,
                  width: 74.w,
                  height: 81.h,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text(
                          location.name,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      Container(
                        height: 21.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(
                            color: const Color.fromRGBO(175, 175, 175, 1),
                            width: 0.5.w,
                          ),
                        ),
                        child: Text(
                          location.category,
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
                            location.city,
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
                            '${location.rating}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NearestImageWidget extends StatelessWidget {
  const NearestImageWidget(
      {super.key,
      required this.imagePath,
      required this.category,
      required this.rating});

  final String imagePath;
  final String category;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.network(
            imagePath,
            height: 167.h,
            width: 167.w,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Transform.translate(
            offset: Offset(10.w, 18.h),
            child: Container(
              height: 21.h,
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 3.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                category,
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

class NearestLocationWidget extends StatelessWidget {
  const NearestLocationWidget({super.key, required this.location});

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DetailsPage(
                  location: location,
                );
              },
            ),
          );
        },
        child: Container(
          width: 180.w,
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
              NearestImageWidget(
                imagePath: location.images.first,
                category: location.category,
                rating: location.rating,
              ),
              SizedBox(height: 10.h),
              Text(
                location.name,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'icons/location.svg',
                      width: 12.w,
                      height: 12.h,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      location.city,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 10.sp,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.city,
    required this.region,
    required this.asset,
  });

  final String city;
  final String region;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return RegionLocations(region: region);
              },
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 236.h,
              width: 175.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    opacity: 0.5,
                    image: AssetImage(
                      asset,
                    ),
                  )),
            ),
            Text(
              city,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Container(
        width: 305.w,
        height: 290.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(175, 175, 175, 1),
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              article.image,
              width: double.infinity,
              height: 135.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    article.source,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    DateFormat('dd MMM yyyy').format(article.date),
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
  }
}
