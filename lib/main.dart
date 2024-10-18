import 'package:flutter/material.dart';
import 'package:utip/bill_amount_field.dart';
import 'package:utip/person_counter.dart';
import 'package:utip/tip_row.dart';
import 'package:utip/tip_slider.dart';
import 'package:utip/total_per_person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip App',
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
  int _personCount = 1;
  double _tipPercentage = 0;
  double _billTotal = 100.0;



  //Methods

  double totalPerPerson(){
    return (_billTotal*_tipPercentage+_billTotal)/_personCount;
  }
  void increment(){
    setState(() {
      _personCount++;
    });
  }

  void decrement(){
    setState(() {
      if(_personCount>1){
        _personCount--;
      }
    });

  }
    //add style
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerPerson();
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
      
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTip'),
       // leading: const Text("Hello"),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
           TotalPerPerson(theme: theme, style: style, total: total),
        Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:Border.all(
                        color: theme.colorScheme.primary,
                        width: 2
                      )
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    //== Bill Amount Text Field
                     BillAmountTextField(billamount: _billTotal.toString(), 
                     onChanged: (String value) { 
                      setState(() {
                        _billTotal=double.parse(value);
                      });
                      },
                     ),
                    
                    PersonCounter(theme: theme, personCount: _personCount, 
                    onDecreament: decrement, onIncreament: increment)
                    ,
                     // == section  Tip ==
                    TipRow(theme: theme, tipPercentage: _tipPercentage, billTotal: _billTotal),

                      // == Slider Text==
                      Text('${(_tipPercentage*100).round()}%'),
                      //== Tip Slider ==
                      TipSlider(tipPercentage: _tipPercentage, onChanged: (double value) { setState(() {_tipPercentage=value;});})
                    ],
                  ),
                  ),
                )

        ],
      ),
    );
  }


}



