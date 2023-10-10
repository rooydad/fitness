import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnass/screens/product/controllers/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  final String url;
  final String name;
  final String inventory;
  final String description;
  final String price;
  final String id;
  DetailController controller = Get.put(DetailController());

  DetailPage(
      {super.key,
      required this.url,
      required this.name,
      required this.inventory,
      required this.description,
      required this.price,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'مشخصات کالا',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Color(0xffab47bc),
      body: ListView(
        children: [
          Container(
            color: Color(0xffab47bc),
            height: Get.height / 3,
            width: Get.width,
            child: CachedNetworkImage(imageUrl: this.url),
          ),
          Container(
              // height: Get.height - Get.height / 3,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      this.name,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "قیمت: " + this.price.seRagham() + " تومان",
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        FaIcon(
                          FontAwesomeIcons.moneyBill,
                          color: Colors.grey,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          int.parse(this.inventory) > 0
                              ? "موجود در انبار: ✅"
                              : "اتمام موجودی در انبار",
                          style: TextStyle(fontSize: 17),
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        FaIcon(
                          FontAwesomeIcons.productHunt,
                          color: Colors.grey,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 100),
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 16, left: 16, top: 16, bottom: 50),
                      child: Text(
                        this.description,
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(height: 2),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {},
            child: FaIcon(FontAwesomeIcons.heart),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: Color(0xffab47bc),
            onPressed: () async {
              SharedPreferences _prefs = await SharedPreferences.getInstance();
              final SharedPreferences prefs = await _prefs;
              String user_email = prefs.getString("email")!;
              controller.addToMyCart(user_email, name, price, url);
            },
            child: FaIcon(FontAwesomeIcons.cartPlus),
          ),
        ],
      ),
    );
  }
}
