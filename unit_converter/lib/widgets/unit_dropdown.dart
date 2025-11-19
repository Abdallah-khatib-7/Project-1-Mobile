import 'package:flutter/material.dart';
import '../utils/conversion_logic.dart';

class UnitDropdown extends StatelessWidget {
  final String value;
  final String label;
  final String category;
  final ValueChanged<String?> onChanged;

  const UnitDropdown({
    super.key,
    required this.value,
    required this.label,
    required this.category,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    List<String> units = ConversionLogic.getUnitsForCategory(category);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text('$label:', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              underline: const SizedBox(), // Remove default underline
              items: units.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(
                    unit,
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}