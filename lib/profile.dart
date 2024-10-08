import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trip_script/consts/constants.dart';
import 'package:trip_script/edit_profile.dart';
import 'package:trip_script/models/user.dart';
import 'package:trip_script/orders.dart';
import 'package:trip_script/providers/user_provider.dart';
import 'package:trip_script/settings.dart';
import 'package:trip_script/support.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: userProvider.getUserDetails(email),
          builder: (context, snapshots){
            if(snapshots.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(snapshots.hasData){
              final User user = snapshots.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100.h),
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
                            ProfileListTile(
                              title: 'Your Orders',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const OrderHistory();
                                    },
                                  ),
                                );
                              },
                              subtitle:
                              'View your order and transaction history here',
                              canExpand: true,
                            ),
                            SizedBox(height: 20.h),
                            ProfileListTile(
                              title: 'Support Center',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SupportCenter(user: user,);
                                    },
                                  ),
                                );
                              },
                              subtitle: 'Find the best answer to your question',
                              canExpand: true,
                            ),
                            SizedBox(height: 20.h),
                            ProfileListTile(
                              title: 'Settings',
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
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const EditProfile();
                                    },
                                  ),
                                );
                              },
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
                                    child: Image.network(
                                      user.imagePath,
                                      width: 43.w,
                                      height: 43.h,
                                    ),
                                  ),
                                  title: Text(
                                    user.name,
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
                        ),
                      )
                    ],
                  ),
                ],
              );
            }
            else if(snapshots.hasError){
              log('Error: ${snapshots.error}');
              return const SizedBox();
            }
            else{
              return const SizedBox();
            }
          },
        )
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
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool canExpand;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
