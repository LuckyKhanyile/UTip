import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required int personCount, 
    required this.onIncreament, required this.onDecreament,
  }) : _personCount = personCount;

  final ThemeData theme;
  final int _personCount;
  final VoidCallback onIncreament;
  final VoidCallback onDecreament;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Split', 
        style: theme.textTheme.titleMedium,),
         Row(
          
          children: [
            IconButton(
              color: theme.colorScheme.primary,
              onPressed:onDecreament, icon: const Icon(Icons.remove)),
            Text(_personCount.toString(), style: theme.textTheme.titleMedium,),
            IconButton(
              color: theme.colorScheme.primary,
            onPressed: onIncreament, icon: const Icon(Icons.add))
          ],
        )
      ],
    );
  }
}