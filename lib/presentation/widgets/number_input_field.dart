import 'package:flutter/material.dart';

class NumberInputField extends StatelessWidget {
  final TextEditingController controller;
  const NumberInputField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(
          labelText: 'Введите число',
          labelStyle: Theme.of(context).textTheme.labelLarge,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
      ),
    );
  }
} 