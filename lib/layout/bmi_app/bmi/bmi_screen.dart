// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../bmiresult/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  bool isMale = true;
  double height = 120.0;
  int weight = 40;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI calculator'
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color:isMale ?  Colors.blue : Colors.grey[350],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Icon(
                              Icons.male , size: 70.0,),
                            SizedBox(
                              height: 15.0,),
                            Text(
                              'Male' , style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(()
                        {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color: isMale ?  Colors.grey[350] : Colors.blue  ,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Icon(
                              Icons.female , size: 70.0,),
                            SizedBox(
                              height: 15.0,),
                            Text(
                              'Female' , style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),

                ],

              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HIGHT',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline:TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize:20.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Slider(value: height,
                        max: 220.0,
                        min: 80.0,
                        onChanged: (value){
                      setState(() {
                        height = value;
                      });
                      if (kDebugMode) {
                        print(value.round());
                      }
                        },
                    ),
                  ],
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[350],
                ),
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[350],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(

                                  onPressed: (){
                                    setState(()
                                    {
                                      weight--;

                                    }
                                    );

                                  } ,
                                heroTag: 'weigh--',
                                  mini: true,
                                child: Icon(Icons.remove),

                                ),
                              FloatingActionButton(

                                onPressed: (){
                                  weight++;
                                } ,
                                heroTag: 'weigh++',
                                mini: true,
                                child: Icon(Icons.add),

                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[350],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(

                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  } ,
                                heroTag: 'age--',
                                  mini: true,
                                child: Icon(Icons.remove),

                                ),
                              FloatingActionButton(

                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                } ,
                                heroTag: 'age++',
                                mini: true,
                                child: Icon(Icons.add),

                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            child: MaterialButton(
              onPressed: ()
              {
              double  result  = weight / pow(height / 100 , 2);
              if (kDebugMode) {
                print(result.round());
              }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:
                            (context) => BMIResultScreen
                              (
                              age: age,
                              isMale: isMale,
                              result: result.round(),
                            ),
                    )
                );
              },
              child: const Text(
                'CALCULAT',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,


                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

