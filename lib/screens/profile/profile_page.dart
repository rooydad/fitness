import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnass/constants/const.dart';
import 'package:fitnass/constants/constants.dart';
import 'package:fitnass/screens/bmi/input_page.dart';
import 'package:fitnass/screens/contact/views/contactus.dart';
import 'package:fitnass/screens/profile/components/controllers/profile_controller.dart';
import 'package:fitnass/screens/profile/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(()=>
         Container(
          padding: const EdgeInsets.all(20.0),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              // profile image
              Container(
                width: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: primaryColor.withOpacity(0.5),
                    width: 5.0,
                  ),
                ),
                child:  CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage:  CachedNetworkImageProvider(mainAddress+'/fitness/'+controller.ImagePath.value),
                ),
              ),
              // end profile image
              const SizedBox(height: 20.0),
              // profile name
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.name.value,
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  SizedBox(
                    height: 20.0,
                    child: Image.asset(
                      'assets/images/verified.png',
                    ),
                  ),
                ],
              ),
              // end profile name
              const SizedBox(height: 10.0),
              // profile email
              Text(
                controller.email.value,
                style: TextStyle(
                  color: blackColor.withOpacity(0.4),
                  fontSize: 15.0,
                ),
              ),
              // end profile email
              const SizedBox(height: 30.0),
              // Profile Options
              Expanded(
                child: SizedBox(
                  height: size.height * 0.4,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      InkWell(
                        onTap: (){controller.pickImage();},
                        child: BuildOptions(
                            title: 'تغییر تصویر پروفایل', icon: Icons.person),
                      ),
                      InkWell(
                        onTap:(){
                          
                        },
                        child: BuildOptions(title: 'حالت شب/روز', icon: Icons.settings)),
                      InkWell(
                        onTap: (){
                          Get.to(()=>BmiInputPage());
                        },
                        child: BuildOptions(
                            title: 'محاسبه BMI', icon: Icons.notifications),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(()=>ContactUs());
                        },
                        child: BuildOptions(
                            title: 'شبکه‌های اجتماعی', icon: Icons.share_rounded),
                      ),
                      InkWell(
                        onTap: (){
                          controller.LogOuting();
                        },
                        child: BuildOptions(title: 'خروج', icon: Icons.logout)),
                    ],
                  ),
                  // end Profile Options
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
