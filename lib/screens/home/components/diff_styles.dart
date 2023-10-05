import 'package:fitnass/screens/home/components/controllers.dart/biggner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DiffStyles extends StatelessWidget {
  BiggenerController controller = Get.put(BiggenerController());

  _buildStyles(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    var style = controller.data[index];

    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
          child: Container(
            margin:
                EdgeInsets.only(top: appPadding * 3, bottom: appPadding * 2),
            width: size.width * 0.4,
            height: size.height * 0.2,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topRight: Radius.circular(100.0)),
                boxShadow: [
                  BoxShadow(
                      color: black.withOpacity(0.3),
                      blurRadius: 20.0,
                      offset: Offset(5, 15))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding / 2,
                      right: appPadding * 3,
                      top: appPadding),
                  child: Text(
                    style['title'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding / 2,
                      right: appPadding / 2,
                      bottom: appPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: black.withOpacity(0.3),
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            style['time'].toString() + ' دقیقه',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: black.withOpacity(0.3)),
                            maxLines: 2,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Icon(
                            Icons.add,
                            color: white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          //  width: size.width * 0.3,
          //     height: size.height * 0.2,
          child: Container(
            child: CachedNetworkImage(
               width: size.width * 0.3,
              height: size.height * 0.2,
              imageUrl: style['pic'],
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: appPadding, vertical: appPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'مشاهده همه',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w800, color: primary),
              ),
              Text(
                'مبتدی هستی؟',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: appPadding / 2),
          child: Container(
            height: size.height * 0.33,
            child: Obx(
              () => ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildStyles(context, index);
                  }),
            ),
          ),
        )
      ],
    );
  }
}
