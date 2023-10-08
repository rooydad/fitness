import 'package:fitnass/constants/constants.dart';
import 'package:fitnass/screens/chat/answers.dart';
import 'package:fitnass/screens/chat/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    var title_style = TextStyle(fontSize: 20, color: Colors.black);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'تیکت پشتیبانی و مشاوره',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              Text(
                'موضوع تیکت',
                style: title_style,
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                elevation: 10.0,
                color: white,
                borderRadius: BorderRadius.circular(30.0),
                child: TextField(
                   controller: controller.titleController,
                  decoration: InputDecoration(
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: appPadding * 0.75, horizontal: appPadding),
                    fillColor: white,
                    hintText: 'مثال:درخواست مشاوره',
                    suffixIcon: Icon(
                      Icons.title,
                      size: 25.0,
                      color: black.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'متن تیکت',
                style: title_style,
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                elevation: 10.0,
                color: white,
                borderRadius: BorderRadius.circular(30.0),
                child: TextField(
                  minLines: 5,
                  maxLines: 10,
                 controller: controller.messageController,
                  decoration: InputDecoration(
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: appPadding * 0.75, horizontal: appPadding),
                    fillColor: white,
                    hintText: 'مشکل یا سوال خود را مطرح نمایید...',
                    suffixIcon: Icon(
                      Icons.title,
                      size: 25.0,
                      color: black.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: StadiumBorder(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                ),
                onPressed: () {controller.SendMessage();},
                child: Text(
                  'ارسال',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [GestureDetector(
                  onTap: (){
                    Get.to(()=>AnswersPage());
                  },
                  child: Text('مشاهده پاسخ های من',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),))],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
