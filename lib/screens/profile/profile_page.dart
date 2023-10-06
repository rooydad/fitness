import 'package:fitnass/constants/constants.dart';
import 'package:fitnass/screens/profile/profile_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(height: 50,),
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
              child: const CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage(
                  'assets/images/profile.jpg',
                ),
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
                  'ساناز امینی',
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
              'sanaz@gmail.com',
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
                  children: const [
                    BuildOptions(title: 'پروفایل من', icon: Icons.person),
                    BuildOptions(title: 'تنظیمات', icon: Icons.settings),
                    BuildOptions(title: 'اطلاع رسانی‌ها', icon: Icons.notifications),
                    BuildOptions(title: 'شبکه‌های اجتماعی', icon: Icons.share_rounded),
                    BuildOptions(title: 'خروج', icon: Icons.logout),
                  ],
                ),
                // end Profile Options
              ),
            ),
          ],
        ),
      ),
    );
  }
}
