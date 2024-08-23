import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
  
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTip'),
        leading: const Text("Hello"),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Container(
            padding: const EdgeInsets.all(18),
            decoration:  BoxDecoration( 
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(10)
              ),
            
            child: const Column(
              children: [
                Text("total per Peson"),
                Text("\$23.89"),
              ],
            )),
        ],
      ),
    );
  }
}


