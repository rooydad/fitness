import 'package:flutter/material.dart';
import '/constants/constants.dart';
import '/data/data.dart';
import '/models/course.dart';

class Courses extends StatelessWidget {
  Widget _buildCourses(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Course course = courses[index];

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: appPadding, vertical: appPadding / 2),
      child: Container(
        height: size.height * 0.2,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.3),
                  blurRadius: 30.0,
                  offset: Offset(10, 15))
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
                        course.name,
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
                            course.students,
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
                            course.time.toString() + ' min',
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
                      image: AssetImage(course.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
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
                Text(
                  'مشاهده همه',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: primary),
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
          Expanded(
              child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return _buildCourses(context, index);
            },
          ))
        ],
      ),
    );
  }
}
