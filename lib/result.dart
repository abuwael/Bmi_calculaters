import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.score});
  final String score;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bmi Result')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.grey[100],
              ),
              height: 200,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Your BMI is', style: TextStyle(fontSize: 30, color: Colors.grey)),
                  Text(widget.score, style: const TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Image.asset(
            //       'assets/images/1.png',
            //       height: 100,
            //       width: double.infinity,
            //     ),
            //     Text(
            //       'asdlka lk as sakld  kld asd ask l asdlka lk as sakld  kld asd ask l asdlka lk as sakld  kld asd ask l',
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
