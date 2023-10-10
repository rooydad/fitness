import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class IntroPageThree extends StatelessWidget {
  final String? urlImage;
  final String? title;
  final String? text1;
  final String? text2;
  final Widget? widget;
  final Widget? nextPage;

  const IntroPageThree(
      {Key? key,
        this.urlImage,
        this.text1,
        this.text2,
        this.title,
        this.widget,
        this.nextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'بیخیال',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Center(
                child: Image.asset(urlImage!, width: width * 0.8),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'حمایت از مصرف کننده',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check,
                    size: 15,
                    color: Colors.purple,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    text1!,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check,
                    size: 15,
                    color: Colors.purple,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    text2!,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 160,
            right: 120,
            left: 120,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => nextPage!),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepOrange,
                ),
                child: Center(child: widget!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}