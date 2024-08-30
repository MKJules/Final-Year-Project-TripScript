import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trip_script/consts/snackbar.dart';
import 'package:trip_script/home1.dart';
import 'package:trip_script/models/location.dart';
import 'package:trip_script/providers/location_provider.dart';

class RegionLocations extends StatelessWidget {
  const RegionLocations({super.key, required this.region});

  final String region;

  @override
  Widget build(BuildContext context) {
    final LocationProvider locationProvider = Provider.of<LocationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '$region Region',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder(
        future: locationProvider.fetchLocationByRegion(region),
        builder: (context, snapshots){
          if(snapshots.connectionState == ConnectionState.waiting){
            return const SizedBox();
          }
          else if(snapshots.hasError){
            log('Error: ${snapshots.error}');
            showCustomSnackbar('Error: ${snapshots.error}', context);
            return const SizedBox();
          }
          else if(snapshots.hasData){
            List<Location> locations = snapshots.data ?? [];
            return ListView.builder(
              itemCount: locations.length,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h,),
              itemBuilder: (context, index){
                Location location = locations[index];
                return RecommendedLocationWidget(location: location);
              },
            );
          }
          else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}
