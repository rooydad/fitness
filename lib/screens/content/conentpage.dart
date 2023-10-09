import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnass/constants/constants.dart';
import 'package:fitnass/screens/content/controllers/content_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ArticlePage extends StatelessWidget {
    Widget _buildCourses(BuildContext context,String image,String title,String level, String time ) {
    Size size = MediaQuery.of(context).size;


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
                        title,
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
                            level=="Yes"?"سطح: مقدماتی":"سطح: پیشرفته",
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
                            time.toString() + ' دقیقه',
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
                      image: CachedNetworkImageProvider(image),
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

  final String title;
  final String headerUrl;
  final String writer;
  final String category;
  final String time;
  final String content;
  final String level;
  ArticlePage({super.key, required this.title, required this.headerUrl, required this.writer, required this.category, required this.time, required this.content, required this.level});

  ContentController controller = Get.put(ContentController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          this.title,
          overflow: TextOverflow.fade,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white, // پس زمینه نوار بالا را سفید کنید
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Container(
                  height: 200, // ارتفاع عکس مقاله
                  child: CachedNetworkImage(imageUrl: this.headerUrl,width: size.width,height: 200,),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                    height: 20.0,
                    child: Image.asset(
                      'assets/images/verified.png',
                    ),
                  ),
                  SizedBox(width: 3,),
                      Text(
                     "مربی: "+this.writer,
                        style: TextStyle(
                          fontSize: 16.0, // اندازه متن عنوان
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      FaIcon(
                        FontAwesomeIcons.pencil,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                       "زمان اجرا: "+this.time.toPersianDigit()+" دقیقه",
                        style: TextStyle(
                          fontSize: 16.0, // اندازه متن عنوان
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      FaIcon(
                        FontAwesomeIcons.clock,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                       this.level=="Yes"?"سطح: ابتدایی":"سطح: پیشرفته",
                        style: TextStyle(
                          fontSize: 16.0, // اندازه متن عنوان
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      FaIcon(
                        FontAwesomeIcons.file,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ],
                  ),
                ),

                 Padding(
                  padding: EdgeInsets.only(right: 16, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "دسته بندی: "+this.category,
                        style: TextStyle(
                          fontSize: 16.0, // اندازه متن عنوان
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 7,),
                      FaIcon(FontAwesomeIcons.tag,color: Colors.grey,size: 20,),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    this.content.toString(),
                    style: TextStyle(
                      height: 2,
                      fontSize: 16.0, // اندازه متن مقاله
                    ),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 180,
              right: size.width / 2 - 100,
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: size.width / 2,
                  height: 50,
                  child: Center(
                    child: Text(this.title),
                  ),
                ),
              ),
            ),
            // ListView.builder(
            //   itemBuilder: (content,index){
            //  // return _buildCourses(context, image, title, level, time);
            // })
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {controller.ShareContent(this.content);},
            child: FaIcon(
              FontAwesomeIcons.shareNodes,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
          ),
          SizedBox(height: 20,),
          FloatingActionButton(
            onPressed: () {controller.show_timer(this.time);},
            child: FaIcon(
              FontAwesomeIcons.clock,
              color: Colors.black,
            ),
            backgroundColor: Colors.yellowAccent,
          ),
        ],
      ),
    );
  }
}