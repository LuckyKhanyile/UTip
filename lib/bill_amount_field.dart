import 'package:flutter/material.dart';

class BillAmountTextField extends StatelessWidget {
  const BillAmountTextField({
    super.key, required this.billamount, required this.onChanged,
  });

  final String billamount;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
     decoration: const InputDecoration(
       border: OutlineInputBorder(),
       prefixIcon: Icon(Icons.attach_money),
       labelText: 'Bill Amount',
     ),
     keyboardType: TextInputType.number,
     onChanged: onChanged
    );
  }
}






