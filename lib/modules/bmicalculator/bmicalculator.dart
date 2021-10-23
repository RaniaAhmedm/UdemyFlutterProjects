import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:udemyr/modules/bmiresult/bmiresult.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height =50.0;
  int weight=40;
  int age=16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 7, 33, 0.9),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 7, 33, 0.8),
        centerTitle: true,
        title: const Text('BMI CALCULATOR',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
      ),
      body: Container(
        color: const Color.fromRGBO(5, 7, 33, 0.9),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color.fromRGBO(5, 7, 33, 0.9),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale=true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: isMale ?Colors.pink : Colors.grey.withOpacity(0.3),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.male,
                                  color: Colors.white,
                                  size: 80.0,
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  'MALE',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale =false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: isMale?Colors.grey.withOpacity(0.3):Colors.pink,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.female,
                                  color: Colors.white,
                                  size: 80.0,
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  'FEMALE',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children:  [
                          Text(
                            '${height.round()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'cm',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value:height,
                        max: 300.0,
                        min: 50.0,
                        onChanged: (value) {
                          setState(() {
                            height=value;

                          });

                        },
                        inactiveColor: Colors.white,
                        thumbColor: Colors.white,
                        activeColor: Colors.pink,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  color: const Color.fromRGBO(5, 7, 33, 0.9),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('WEIGHT',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20.0,
                                  )),
                               Text(
                                '$weight',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    heroTag: '-weight',
                                    child: const Icon(Icons.remove),
                                    mini: true,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.3),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    heroTag: '+weight',
                                    child: const Icon(Icons.add),
                                    mini: true,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.3),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('AGE',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20.0,
                                  )),
                               Text(
                                '$age',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    heroTag: '-age',
                                    child: const Icon(Icons.remove),
                                    mini: true,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.3),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    heroTag: '+age',
                                    child: const Icon(Icons.add),
                                    mini: true,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.3),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.pink,
              child: MaterialButton(
                onPressed: () {
                  double result =weight / pow(height/100,2);
                  print(result.round());
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> BmiResult(
                    age: age,
                     isMale: isMale,
                     result:result,
                  ),));
                },
                height: 60.0,
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
