import 'package:flutter/material.dart';
import 'cons.dart';
import 'MaterialCard.dart';

class ResultPage extends StatelessWidget {

  const ResultPage({Key? key,required this.bmi_result,required this.ResultText, required this.interpretation}) : super(key: key);

  final String bmi_result;
  final String ResultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('نتیجه',style: TextStyle(fontFamily: 'yekan',color: Colors.black),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomRight,
              child: Text(
                'نتیجه شما : ',
                style: TitleTextStile,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: MyCard(
              InActiveColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(ResultText.toUpperCase(),style: Resultstyle,),
                  Text(bmi_result,style: ScoreStyle,),
                  Text(interpretation.toUpperCase(),textAlign: TextAlign.center,style: Bodystyle,textDirection: TextDirection.rtl,),

                ],
              ),
                (){

                }
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomheight,
              child: Center(child: Text('محاسبه دوباره',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,fontFamily: 'yekan'),)),
            ),
          ),
        ],

      ),
    );
  }
}
