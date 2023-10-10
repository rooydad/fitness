import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:fitnass/screens/chat/controller/answers_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnswersPage extends StatelessWidget {
  AnswerController controller = Get.put(AnswerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("پاسخ پشتیبان",style: TextStyle(color: Colors.black),),
      ),
      body:controller.messages.length==0?Center(child: Text("پاسخی از سوی پشتیبانی یافت نشد"),): Padding(
        padding: const EdgeInsets.only(left:1,top: 20),
        child: Obx(()=>
           ListView.builder(
            itemCount: controller.messages.length,
            itemBuilder: (context,index){
            return BubbleSpecialThree(
        text: controller.messages[index]['message'],
        color: Color(0xFFE8E8EE),
        textStyle: TextStyle(fontFamily: "yekan"),
        seen: true,
        tail: false,
        isSender: false,
      );
          }),
        ),
      ),
    );
  }
}