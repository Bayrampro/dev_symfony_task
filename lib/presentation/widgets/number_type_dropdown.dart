import 'package:flutter/material.dart';

class NumberTypeDropdown extends StatelessWidget {
  final String value;
  final List<String> types;
  final ValueChanged<String?> onChanged;
  const NumberTypeDropdown({Key? key, required this.value, required this.types, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          borderRadius: BorderRadius.circular(16),
          items: types
              .map((type) => DropdownMenuItem(
                    value: type,
                    child: Row(
                      children: [
                        Icon(
                          type == 'trivia'
                              ? Icons.lightbulb_outline
                              : type == 'math'
                                  ? Icons.calculate
                                  : Icons.date_range,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(type.toUpperCase(), style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
} 