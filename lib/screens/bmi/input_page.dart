import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableColumn.dart';
import 'MaterialCard.dart';
import 'cons.dart';
import 'resultspage.dart';
import 'calculator_brain.dart';

enum GenderType {
  Male,
  Female,
}

class BmiInputPage extends StatefulWidget {
  @override
  _BmiInputPageState createState() => _BmiInputPageState();
}

class _BmiInputPageState extends State<BmiInputPage> {
  int height = 180;
  int weight = 60;
  int Age = 20;
  Color MaleColor = InActiveColor;
  Color FemaleColor = InActiveColor;

  void UpdateColor(GenderType gender) {
    if (gender == GenderType.Male) {
      if (MaleColor == InActiveColor) {
        FemaleColor = InActiveColor;
        MaleColor = ActiveCardColor;
      } else {
        MaleColor = InActiveColor;
      }
    } else {
      if (FemaleColor == InActiveColor) {
        MaleColor = InActiveColor;
        FemaleColor = ActiveCardColor;
      } else {
        FemaleColor = InActiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true,
        title: Text('BMI',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: MyCard(FemaleColor,
                      ReusableColumn(FontAwesomeIcons.venus, 'مونث'), () {
                    setState(() {
                      UpdateColor(GenderType.Female);
                    });
                  }),
                ),
                Expanded(
                  child: MyCard(
                      MaleColor, ReusableColumn(FontAwesomeIcons.mars, 'مذکر'),
                      () {
                    setState(() {
                      UpdateColor(GenderType.Male);
                    });
                  }),
                ),
              ],
            )),
            Expanded(
              child: MyCard(
                  InActiveColor,
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'قد',
                        style: LableStyle,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.toString(),
                            style: NumberStyle,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'سانتی متر',
                            style: LableStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xff8d8e98),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: Color(0x29eb1555),
                          thumbColor: Color(0xffeb1555),
                          activeTrackColor: Colors.white,
                        ),
                        child: Slider(
                          onChanged: (double value) {
                            setState(() {
                              height = value.toInt();
                            });
                          },
                          value: height.toDouble(),
                          max: 220,
                          min: 120,
                          //activeColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  () {}),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: MyCard(
                      InActiveColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'وزن',
                            style: LableStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: NumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RoundIconButton(
                                child: FontAwesomeIcons.minus,
                                clicks: () {
                                  setState(() {
                                    if (weight > 10) {
                                      weight--;
                                    }
                                  });
                                },
                              ),
                              RoundIconButton(
                                child: FontAwesomeIcons.plus,
                                clicks: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      () {}),
                ),
                Expanded(
                  child: MyCard(
                      InActiveColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'سن',
                            style: LableStyle,
                          ),
                          Text(
                            Age.toString(),
                            style: NumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RoundIconButton(
                                child: FontAwesomeIcons.minus,
                                clicks: () {
                                  setState(() {
                                    if (Age > 1) {
                                      Age--;
                                    }
                                  });
                                },
                              ),
                              RoundIconButton(
                                child: FontAwesomeIcons.plus,
                                clicks: () {
                                  setState(() {
                                    Age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      () {}),
                ),
              ],
            )),
            GestureDetector(
              onTap: () {
                Calculator_brain calc = Calculator_brain(height, weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmi_result: calc.CalculateBMI(),
                            ResultText: calc.getresults(),
                            interpretation: calc.getinterpretation(),
                          )),
                );
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomheight,
                child: Center(
                    child: Text(
                  'محاسبه کن !',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'yekan'),
                      textDirection: TextDirection.rtl,
                ),
              
                ),
              ),
            ),
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData? child;
  final VoidCallback? clicks;

  const RoundIconButton({Key? key, @required this.clicks, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(child),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      elevation: 6,
      disabledElevation: 6,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      onPressed: clicks,
    );
  }
}
