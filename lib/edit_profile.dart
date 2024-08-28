import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emergencyController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                  vertical: 50.h,
                ),
                children: [
                  Text(
                    'Account Info',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: double.infinity,
                    height: 95.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: const Color.fromRGBO(175, 175, 175, 1),
                      ),
                    ),
                    child: ListTile(
                      leading: SizedBox(
                        width: 50.w,
                        child: Stack(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'images/user.jpeg',
                                width: 50.w,
                                height: 50.h,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 7.r,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15.sp,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      title: Text(
                        'Your Photo',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(right: 50.w),
                        child: Text(
                          'Adding a profile picture makes your profile more personalized.',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10.sp,
                            color: const Color.fromRGBO(112, 112, 112, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Form(
                    key: formKey,
                    child: SizedBox(
                      height: 600.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 15.h,
                              ),
                              hintText: 'Your name',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 10.sp,
                                color: const Color.fromRGBO(149, 149, 149, 1),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.r),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(149, 149, 149, 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          Text(
                            'Email, Phone Number & Emergency Number',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 15.h,
                              ),
                              hintText: 'youremail@google.com',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 10.sp,
                                color: const Color.fromRGBO(149, 149, 149, 1),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.r),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(149, 149, 149, 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Phone Number',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: numberController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 15.h,
                              ),
                              hintText: '0240123456',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 10.sp,
                                color: const Color.fromRGBO(149, 149, 149, 1),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.r),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(149, 149, 149, 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Emergency Number',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: emergencyController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 15.h,
                              ),
                              hintText: '0240123456',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 10.sp,
                                color: const Color.fromRGBO(149, 149, 149, 1),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.r),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(149, 149, 149, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      elevation: 0,
                      fixedSize: Size(double.infinity, 60.h),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
