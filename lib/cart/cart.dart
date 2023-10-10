import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List image = ['assets/images/course1.jpg'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

         systemOverlayStyle: SystemUiOverlayStyle(
             statusBarColor: Colors.white,
             statusBarBrightness: Brightness.light,
             statusBarIconBrightness: Brightness.dark),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('سبد خرید',style: TextStyle(color: Colors.black),),
      ),
      body: ListView.builder(
        itemCount: image.length,
        itemBuilder: (context,index){
          return SizedBox(
            height: 80,
            child: Card(
              color: Colors.grey,
              shadowColor: Colors.grey,
              child: Row(
                children: [
                  ClipOval(
                    child: Image(
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      image: AssetImage(image[index]),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text('product')
                ],
              ),
            ),
          );
        },
      ),
    );
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
  }
}
