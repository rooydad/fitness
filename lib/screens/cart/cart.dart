import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnass/screens/cart/component/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CartController controller = Get.put(CartController());

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
        title: Text(
          'سبد خرید',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:Obx(()=>
         controller.cartList.isEmpty?Center(
          child: Text('لیست خالی است'),
        ):  ListView.builder(
            itemCount: controller.cartList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 16, left: 16, top: 8),
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(controller.cartList[index]['name']),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("قیمت کالا: " +
                                    controller.cartList[index]['price']
                                        .toString()
                                        .seRagham() +
                                    " تومان"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ClipOval(
                        child: Image(
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                              controller.cartList[index]['url']),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          
                        },
                        child: Icon(Icons.delete,color: Colors.red)),
                    ],
                  ),
                ),
              );
            },
          ),
        
      ),
      floatingActionButton: InkWell(
        onTap: () {
          controller.ShowFinalDialog();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          width: Get.width / 2,
          height: 60,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'پرداخت نهایی',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Obx(
                  () => Text(
                    controller.totalPrice.toString().seRagham() + " تومان",
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 14),
                    textDirection: TextDirection.rtl,
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
