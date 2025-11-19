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
        items: const [
          DropdownMenuItem(value: 'Length', child: Text('Length')),
          DropdownMenuItem(value: 'Weight', child: Text('Weight')),
          DropdownMenuItem(value: 'Temperature', child: Text('Temperature')),
          DropdownMenuItem(value: 'Digital Storage', child: Text('Digital Storage')),
          DropdownMenuItem(value: 'Frequency', child: Text('Frequency')),
          DropdownMenuItem(value: 'Area', child: Text('Area')),
          DropdownMenuItem(value: 'Volume', child: Text('Volume')),
          DropdownMenuItem(value: 'Time', child: Text('Time')),
        ],
        onChanged: onChanged,
      ),
    );
  }
}