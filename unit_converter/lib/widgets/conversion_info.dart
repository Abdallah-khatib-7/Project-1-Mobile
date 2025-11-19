import 'package:flutter/material.dart';

class ConversionInfo extends StatelessWidget {
  final String currentCategory;

  const ConversionInfo({super.key, required this.currentCategory});

  @override
  Widget build(BuildContext context) {
    Map<String, String> categoryDescriptions = {
      'Length': 'Convert between meters, kilometers, feet, miles, etc.',
      'Weight': 'Convert between kilograms, grams, pounds, ounces, etc.',
      'Temperature': 'Convert between Celsius, Fahrenheit, and Kelvin',
      'Digital Storage': 'Convert between bytes, KB, MB, GB, TB, etc.',
      'Frequency': 'Convert between Hz, kHz, MHz, GHz',
      'Area': 'Convert between square meters, square feet, acres, etc.',
      'Volume': 'Convert between liters, milliliters, gallons, etc.',
      'Time': 'Convert between seconds, minutes, hours, days, etc.',
    };

    return Container(
      padding: const EdgeInsets.all(12), // Reduced padding
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About $currentCategory',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // Smaller font
          ),
          const SizedBox(height: 6), // Reduced spacing
          Text(
            categoryDescriptions[currentCategory] ?? 'Unit conversion',
            style: TextStyle(fontSize: 12, color: Colors.grey[700]), // Smaller font
          ),
        ],
      ),
    );
  }
}