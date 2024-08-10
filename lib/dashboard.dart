import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_script/home1.dart';
import 'package:trip_script/profile.dart';
import 'package:trip_script/wishlist.dart';
import 'package:trip_script/notification.dart' as n;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [HomeScreen(), Wishlist(), n.Notification(), ProfileScreen()];
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        enableFeedback: false,
        iconSize: 30.sp,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        useLegacyColorScheme: false,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
          color: Colors.white,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
          color: Colors.white,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            activeIcon: Icon(
              Icons.home,
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
              ),
              activeIcon: Icon(
                Icons.favorite,
              ),
              label: 'Wishlist'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_outlined,
              ),
              activeIcon: Icon(
                Icons.notifications,
              ),
              label: 'Notification'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              activeIcon: Icon(
                Icons.person,
              ),
              label: 'Profile'
          )
        ],
      ),
    );
  }
}
