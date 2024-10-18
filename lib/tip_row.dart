import 'package:flutter/material.dart';

class TipRow extends StatelessWidget {
  const TipRow({
    super.key,
    required this.theme,
    required double tipPercentage,
    required double billTotal,
  }) : _tipPercentage = tipPercentage, _billTotal = billTotal;

  final ThemeData theme;
  final double _tipPercentage;
  final double _billTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
          Text('Tip',style: theme.textTheme.titleMedium,),
          Text("\$${(_tipPercentage*_billTotal).toStringAsFixed(2)}", style: theme.textTheme.bodyLarge)
          ],
      );
  }
}