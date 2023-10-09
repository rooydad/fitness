import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:share_plus/share_plus.dart';


class ContentController extends GetxController {
  final CountdownController _controller =
      new CountdownController(autoStart: false);

  void show_timer(String time) async {
    int seconds = int.parse(time)*60;
    Get.defaultDialog(
        title: "زمان سنج",
        content: Column(
          children: [
            Text(
              'مدت زمان تعیین شده جهت انجام این حرکت ' +
                  time +
                  ' دقیقه می باشد',
              textDirection: TextDirection.rtl,
            ),
            Countdown(
              controller: _controller,
              seconds: seconds,
              build: (BuildContext context, double time) => Text(
                time.toInt().toString() + " ثانیه ",
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 20),
              ),
              interval: Duration(milliseconds: 100),
              onFinished: () {
                Get.defaultDialog(
                    title: "زمان انجام به پایان رسید",
                    content: Column(
                      children: [
                        Text(
                          "مدت زمان انجام این حرکت به پایان رسیده است. چنانچه موفق به اتمام حرکت نشده اید میتوانید یک بار دیگر امتحان کنید!",
                          textDirection: TextDirection.rtl,
                        )
                      ],
                    ));
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, shape: StadiumBorder()),
              onPressed: () {
                _controller.start();
              },
              child: Text("آغاز تایمر"),
            ),
          ],
        ));
  }

  void ShareContent(String content)async{
    Share.share(content);
  }
}
