import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final double inputValue;
  final String fromUnit;
  final double result;
  final String toUnit;

  const ResultDisplay({
    super.key,
    required this.inputValue,
    required this.fromUnit,
    required this.result,
    required this.toUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16), // Reduced padding
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue[100]!, Colors.purple[100]!],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Conversion Result',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue), // Smaller font
          ),
          const SizedBox(height: 12), // Reduced spacing

          // Input value
          Text(
            '$inputValue $fromUnit',
            style: TextStyle(fontSize: 14, color: Colors.grey[700]), // Smaller font
          ),

          // Arrow
          const SizedBox(height: 6), // Reduced spacing
          const Icon(Icons.arrow_downward, color: Colors.blue, size: 20), // Smaller icon
          const SizedBox(height: 6), // Reduced spacing

          // Result value
          Text(
            '${result.toStringAsFixed(6)} $toUnit',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue), // Smaller font
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}