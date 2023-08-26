import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  int currentindex = 0;
  String result = "";
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double height = 0;
  double weight = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bmi Calculater'), actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))]),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                radioutton("Male", Colors.grey[100]!, 0, const Icon(Icons.male)),
                const SizedBox(width: 10),
                radioutton("Female", Colors.grey[100]!, 1, const Icon(Icons.female)),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "Your height",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 30),
                      filled: true,
                      fillColor: Colors.white30,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Height(in cm)', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "Your weight",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 30),
                      filled: true,
                      fillColor: Colors.white30,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Weight(in kg)', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    height = double.parse(heightController.value.text);
                    weight = double.parse(weightController.value.text);
                  },
                );
                calculaterBmi(height, weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(score: '$result')));
              },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.blueAccent),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('submit', style: TextStyle(fontSize: 30, color: Colors.white))],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void calculaterBmi(double height, double weight) {
    double finalresult = weight / (height * height / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioutton(String value, Color color, int index, Icon icons) {
    return Flexible(
      child: GestureDetector(
        onTap: () => changeIndex(index),
        child: Container(
          margin: const EdgeInsets.all(30.0),
          padding: const EdgeInsets.all(10.0),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: currentindex == index ? color : Colors.white,
            border: Border.all(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icons.icon, size: 70, color: currentindex == index ? Colors.blueAccent : Colors.black),
              const SizedBox(height: 20),
              Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
