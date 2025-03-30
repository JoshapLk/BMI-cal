import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 70;

  String gender = '';

  late double bmi = calBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 227, 249, 255),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 26),
                    child: Text(
                      'BMI Calculator',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 7, 65, 111),
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      print("Male");
                      setState(() {
                        gender = 'M';
                      });
                      
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: gender == 'M'? Colors.lightBlue.withAlpha(150) : Colors.lightBlue.withAlpha(30), 
                        borderRadius: BorderRadius.circular(25),
                      ),
                      height: 175,
                      width: 170,                    
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.male, size: 120),
                          Text("Male",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),
                    ),
                  ),

                  Spacer(),

                  GestureDetector(
                    onTap: (){
                      print("Female");
                      setState(() {
                        gender = 'F';
                      });
                      
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: gender == 'F'? Colors.lightBlue.withAlpha(150) : Colors.lightBlue.withAlpha(30),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      height: 175,
                      width: 170,                    
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.female, size: 120),
                          Text("Female",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 80),

              Container(decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent,
              width: 3,),
              borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Height (Cm)",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          
                          Text(
                            "$height",
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height > 50) {
                                      height--;
                                      bmi = calBMI(
                                        height: height,
                                        weight: weight,
                                      );
                                    }
                                  });
                
                                  print(height);
                                },
                                child: Icon(Icons.remove),
                              ),
                
                              SizedBox(width: 25),
                
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height < 230) {
                                      height++;
                                      bmi = calBMI(
                                        height: height,
                                        weight: weight,
                                      );
                                    }
                                  });
                                  print(height);
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                
                    Spacer(),
                
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Weight (Kg)",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text(
                            "$weight",
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 30) {
                                      weight--;
                                      bmi = calBMI(
                                        height: height,
                                        weight: weight,
                                      );
                                    }
                                  });
                                  print(weight);
                                },
                                child: Icon(Icons.remove),
                              ),
                
                              SizedBox(width: 25),
                
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight < 300) {
                                      weight++;
                                      bmi = calBMI(
                                        height: height,
                                        weight: weight,
                                      );
                                    }
                                  });
                                  print(weight);
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50.0),

              Column(
                children: [
                  const Text("Body Mass Index (BMI)",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: TextStyle(
                      color:
                      kTextColor,
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    getResult(bmi),
                    style: TextStyle(
                      color:
                          bmi >= 25
                              ? Colors.red
                              : (bmi > 18.5 ? Colors.green : Colors.orange),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Over Weight !";
    } else if (bmiValue > 18.5) {
      return "Normal !";
    } else {
      return "Under Weight !";
    }
  }
}
                  