import 'package:fitnass/screens/home/home_screen.dart';
import 'package:fitnass/screens/intro/widgets/intro_three.dart';
import 'package:fitnass/screens/intro/widgets/page_view_intro.dart';
import 'package:fitnass/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class IntroPages extends StatefulWidget {
  const IntroPages({Key? key}) : super(key: key);

  @override
  State<IntroPages> createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: height,
                  child: PageView(
                    controller: pageController,
                    children: [
                      IntroWidget(
                        pageController: pageController,
                        page: 1,
                        urlImage: 'assets/images/pose1.png',
                        title: 'رسیدن به قله پیروزی آسان است',
                        text1: 'همه چیز به خودت بستگی دارد',
                        text2: 'زندگی خودت را بساز',
                        widget: const Text(
                          'بعدی',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      IntroWidget(
                        pageController: pageController,
                        page: 2,
                        urlImage: 'assets/images/pose2.png',
                        title: 'ورزش ضامن سلامت شماست',
                        text1: 'تلاش کنیم رکورد خود را بشکنیم نه رکورد دیگران را',
                        text2: 'چیزی را که ذهن قبول کرده، بدن به دستش می‌آورد',
                        widget: const Text(
                          'بعدی',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                       IntroPageThree(
                        nextPage: LoginScreen(),
                        urlImage: 'assets/images/pose3.png',
                        title: 'ورزش چیزی جز یک معجزه نیست',
                        text1: 'تنها ورزش کردن است که روحیه را تقویت می کند',
                        text2: 'ورزش برای تحرک داشتنه، نه نابود کردن',
                        widget: Icon(
                          Icons.home,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 100,
              right: 150,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.deepOrange,
                    dotWidth: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}