import 'package:fitnass/screens/home/home_screen.dart';
import 'package:fitnass/screens/intro/widgets/intro_three.dart';
import 'package:fitnass/screens/intro/widgets/page_view_intro.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spana_app/features/intro/presentation/views/home.dart';
import 'package:spana_app/features/intro/presentation/widgets/page_three_pageview.dart';
import 'package:spana_app/features/intro/presentation/widgets/pageview_widget.dart';

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
                        urlImage: 'assets/images/intro1.png',
                        title: 'حمایت از مصرف کننده',
                        text1: 'تضمین مطابق بودن کالا با عکس کالا و توضیحات',
                        text2: 'تعهد ارسال به موقع توسط تولید کننده',
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
                        urlImage: 'assets/images/intro2.png',
                        title: 'ارتباط مستقیم با تولید کننده',
                        text1: 'دریافت اطلاعات درباره محصول',
                        text2: 'سفارش سازی محصول',
                        widget: const Text(
                          'بعدی',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                       IntroPageThree(
                        nextPage: HomeScreen(),
                        urlImage: 'assets/images/intro3.png',
                        title: 'پرداخت امن اسپانا',
                        text1: 'بازگشت وجه در صورت عدم رضایت از محصول',
                        text2: 'آزاد کردن وجه برای فروشنده بعد از تحویل کالا',
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