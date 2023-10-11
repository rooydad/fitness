import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MoreProfilePage extends StatelessWidget {
  const MoreProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('تکمیل اطلاعات شخصی',style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        children: [
            Padding(padding: EdgeInsets.all(16),
            child: Text('کاربر گرامی ، در این بخش می توانید اطلاعات شخصی و جسمی خود را جهت برخورداری از بهترین و با کیفیت ترین مشاوره تیم مشاوره ما اضافه کنید. توجه داشته باشید که اطلاعات شما در سرور های ما به صورت رمز گذاری شده ذخیره خواهد شد و جای هیچ گونه نگرانی نیست.',
            textAlign: TextAlign.justify,
            textDirection: TextDirection.rtl,
            ),),
            
        ],
      ),
    );
  }
}