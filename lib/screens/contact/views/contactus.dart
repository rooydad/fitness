import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    final _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
      title: Text('شبکه های اجتماعی',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue, Colors.purple])),
                child: Container(
                  height: _height * 0.5,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image(
                            height: _height * 0.2,
                            image: AssetImage('assets/images/yoga.png'),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "تیم برنامه نویسی پرواز",
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: _launchURLFacebook,
                              child: Image(
                                height: _height * 0.11,
                                image: AssetImage('assets/images/instagram.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: _launchURLLinkedIn,
                              child: Image(
                                height: _height * 0.1,
                                image: AssetImage('assets/images/telegram.png'),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onTap: _launchURLMedium,
                              child: Image(
                                height: _height * 0.075,
                                image: AssetImage('assets/images/email.png'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "این اپلیکیشن حاصل تلاش شبانه روزی مهندسین شهرستان خوی می باشد، در صورت هرگونه پیشنهاد و انتقاد از عملکرد برنامه و یا پشتیبانی اپلیکیشن از طریق شبکه های اجتماعی بالا و یا دکمه ی تماس پایین با ما در ارتباط باشد.",
                      style: TextStyle(
                          fontSize: 20.0),
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 15.0),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.deepOrange)),
                      ),
                      child: Text(
                        'تماس با مدیریت',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        // ignore: unnecessary_statements
                        setState(() {
                          _launchCaller();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURLLinkedIn() async {
  const url = 'https://t.me/AmirrezaKhezerlou';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLFacebook() async {
  const url = 'https://instagram.com/cleancode_ir';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLMedium() async {
  final Email email = Email(
  body: '',
  subject: 'ارتباط با مدیریت',
  recipients: ['mrkhezerlou@gmail.com'],
  isHTML: false,
);

await FlutterEmailSender.send(email);
}

_launchCaller() async {
  const url = "tel:+989382729583";
    await launch(url);
   
}
