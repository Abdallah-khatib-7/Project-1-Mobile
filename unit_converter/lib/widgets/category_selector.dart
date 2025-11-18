import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String?> onChanged;

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: selectedCategory,
        isExpanded: true,
        items: [
          'Length',
          'Weight',
          'Temperature',
          'Digital Storage',
          'Frequency',
          'Area',
          'Volume',
          'Time'
        ].map((String category) {
          return DropdownMenuItem<String>(
            value: category,
            child: Text(
              category,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}