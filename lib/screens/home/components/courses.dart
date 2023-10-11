import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnass/screens/content/conentpage.dart';
import 'package:fitnass/screens/home/components/controllers.dart/courses_controller.dart';
import 'package:fitnass/screens/seeAll/see_all.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/constants/constants.dart';

// ignore: must_be_immutable
class Courses extends StatelessWidget {
  CoursesController controller = Get.put(CoursesController());
  Widget _buildCourses(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    var style = controller.courses[index];
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ArticlePage(
            title: style['title'],
            headerUrl: style['wallpaper'],
            writer: style['writer'],
            category: style['category'],
            time: style['time'],
            content: style['content'],
            level: style['is_beginner'],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: appPadding, vertical: appPadding / 2),
        child: Container(
          
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                    color: black.withOpacity(0.3),
                    blurRadius: 10.0,
                    offset: Offset(7, 7))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(appPadding),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: appPadding / 2, top: appPadding / 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          style['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              style['is_biggner'] == "Yes"
                                  ? "سطح: مقدماتی"
                                  : "سطح: پیشرفته",
                              style: TextStyle(
                                color: black.withOpacity(0.3),
                              ),
                              overflow: TextOverflow.fade,
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Icon(
                              Icons.folder_open_rounded,
                              color: black.withOpacity(0.3),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "زمان: " +
                                  style['time'].toString().toPersianDigit() +
                                  " دقیقه",
                              style: TextStyle(
                                color: black.withOpacity(0.3),
                              ),
                              overflow: TextOverflow.fade,
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Icon(
                              Icons.access_time_outlined,
                              color: black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: size.width * 0.3,
                    height: size.height * 0.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        image: CachedNetworkImageProvider(style['wallpaper']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: appPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: ()async{
                                SharedPreferences _prefs = await SharedPreferences.getInstance();
            final SharedPreferences prefs = await _prefs;
            prefs.setString("params", "all");
            Get.to(()=>SeeAllPage());
                  },
                  child: Text(
                    'مشاهده همه',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: primary),
                  ),
                ),
                Text(
                  'حرفه‌ای باش',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Expanded(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildCourses(context, index);
              },
            )),
          )
        ],
      ),
    );
  }
}
