import 'package:flutter/material.dart';

class NumberFactCard extends StatelessWidget {
  final String text;
  final String type;
  const NumberFactCard({Key? key, required this.text, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      color: colorScheme.surface.withOpacity(0.95),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              type == 'trivia'
                  ? Icons.lightbulb_outline
                  : type == 'math'
                      ? Icons.calculate
                      : Icons.date_range,
              color: colorScheme.primary,
              size: 40,
            ),
            const SizedBox(height: 16),
            Text(
              text,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
} 