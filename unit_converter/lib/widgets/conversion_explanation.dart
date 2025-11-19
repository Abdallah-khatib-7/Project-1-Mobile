import 'package:flutter/material.dart';
import '../utils/conversion_logic.dart';

class ConversionExplanation extends StatelessWidget {
  final String fromUnit;
  final String toUnit;
  final String category;
  final double inputValue;
  final double result;

  const ConversionExplanation({
    super.key,
    required this.fromUnit,
    required this.toUnit,
    required this.category,
    required this.inputValue,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final formulaInfo = ConversionLogic.getConversionFormula(fromUnit, toUnit, category);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Icon(Icons.calculate, color: Colors.green[700], size: 20),
              const SizedBox(width: 8),
              Text(
                'Conversion Formula',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),


          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green[100]!),
            ),
            child: Text(
              formulaInfo['formula']!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'monospace',
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 8),

          // Explanation
          Text(
            formulaInfo['explanation']!,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),

          const SizedBox(height: 12),


          if (inputValue != 0) ...[
            Divider(color: Colors.green[200]),
            Text(
              'Example with ${inputValue.toStringAsFixed(2)} $fromUnit:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.green[700],
              ),
            ),
            const SizedBox(height: 6),
            _buildExampleCalculation(),
          ],
        ],
      ),
    );
  }

  Widget _buildExampleCalculation() {
    if (fromUnit == toUnit) {
      return Text(
        '${inputValue.toStringAsFixed(2)} $fromUnit = ${result.toStringAsFixed(6)} $toUnit',
        style: const TextStyle(fontSize: 13, fontFamily: 'monospace'),
      );
    }

    switch ('$fromUnit to $toUnit') {
      case 'Celsius to Fahrenheit':
        return Text(
          '(${inputValue.toStringAsFixed(2)} × 9/5) + 32 = ${result.toStringAsFixed(2)}°F',
          style: const TextStyle(fontSize: 13, fontFamily: 'monospace'),
        );
      case 'Fahrenheit to Celsius':
        return Text(
          '(${inputValue.toStringAsFixed(2)} - 32) × 5/9 = ${result.toStringAsFixed(2)}°C',
          style: const TextStyle(fontSize: 13, fontFamily: 'monospace'),
        );
      case 'Celsius to Kelvin':
        return Text(
          '${inputValue.toStringAsFixed(2)} + 273.15 = ${result.toStringAsFixed(2)}K',
          style: const TextStyle(fontSize: 13, fontFamily: 'monospace'),
        );
      case 'Kelvin to Celsius':
        return Text(
          '${inputValue.toStringAsFixed(2)} - 273.15 = ${result.toStringAsFixed(2)}°C',
          style: const TextStyle(fontSize: 13, fontFamily: 'monospace'),
        );
      default:

        final formulaInfo = ConversionLogic.getConversionFormula(fromUnit, toUnit, '');
        final formula = formulaInfo['formula']!;
        if (formula.contains('×')) {
          final parts = formula.split('×');
          if (parts.length == 2) {
            final factor = parts[1].trim();
            return Text(
              '${inputValue.toStringAsFixed(2)} × $factor = ${result.toStringAsFixed(6)}',
              style: const TextStyle(fontSize: 13, fontFamily: 'monospace'),
            );
          }
        }
        return Text(
          '${inputValue.toStringAsFixed(2)} $fromUnit = ${result.toStringAsFixed(6)} $toUnit',
          style: const TextStyle(fontSize: 13, fontFamily: 'monospace'),
        );
    }
  }
}