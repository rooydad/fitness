import 'package:fitnass/constants/constants.dart';
import 'package:fitnass/screens/product/controllers/shop_controller.dart';
import 'package:fitnass/screens/product/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

// ignore: must_be_immutable
class ShopPage extends StatelessWidget {
  ShopController controller = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            Stack(
              children: [
                const FaIcon(
                  FontAwesomeIcons.cartShopping,
                  color: Colors.blue,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      '0',
                      style: TextStyle(color: white, fontSize: 8),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        title: Text(
          'کالاهای فروشگاه',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(
        () => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 3,
            crossAxisCount: 2, // تعداد ستون‌ها در GridView
            crossAxisSpacing: 0, // فاصله بین ستون‌ها
            mainAxisSpacing: 10.0, // فاصله بین ردیف‌ها
          ),
          itemCount: controller.Products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: controller.Products[index]);
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => DetailPage(
              url: product['picture'],
              name: product['name'],
              inventory: product['inventory'],
              description: product['details'],
              price: product['price'],
              id: product['id'].toString()),
        );
      },
      child: Card(
        elevation: 10, // تنظیم elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // ایجاد گوشه‌های خمیده
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product['picture'], // آدرس تصویر از اینترنت
              height: 120, // ارتفاع تصویر
              width: 140, // عرض تصویر
              fit: BoxFit.contain,
            ),
            Text(
              product['name'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'قیمت: ${product['price'].toString().seRagham() + " تومان"}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue, // رنگ قیمت
              ),
            ),
            Text(
              'موجودی انبار: ${product['inventory']}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.green, // رنگ موجودی انبار
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(5.0)),
                child: Icon(
                  Icons.add,
                  color: white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
