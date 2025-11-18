import 'package:flutter/material.dart';

class ConversionLogic {
  static final List<String> categories = [
    'Length',
    'Weight',
    'Temperature',
    'Digital Storage',
    'Frequency',
    'Area',
    'Volume',
    'Time'
  ];

  static final Map<String, List<String>> categoryUnits = {
    'Length': ['Meters', 'Kilometers', 'Centimeters', 'Millimeters', 'Miles', 'Feet', 'Inches', 'Yards'],
    'Weight': ['Kilograms', 'Grams', 'Milligrams', 'Micrograms', 'Tons', 'Pounds', 'Ounces'],
    'Temperature': ['Celsius', 'Fahrenheit', 'Kelvin'],
    'Digital Storage': ['Bytes', 'Kilobytes', 'Megabytes', 'Gigabytes', 'Terabytes', 'Petabytes'],
    'Frequency': ['Hertz', 'Kilohertz', 'Megahertz', 'Gigahertz'],
    'Area': ['Square Meters', 'Square Kilometers', 'Square Feet', 'Square Miles', 'Acres', 'Hectares'],
    'Volume': ['Liters', 'Milliliters', 'Cubic Meters', 'Cubic Feet', 'Gallons', 'Quarts'],
    'Time': ['Seconds', 'Minutes', 'Hours', 'Days', 'Weeks', 'Months', 'Years'],
  };

  static final Map<String, double> baseConversionFactors = {
    'Meters': 1.0,
    'Kilometers': 1000.0,
    'Centimeters': 0.01,
    'Millimeters': 0.001,
    'Miles': 1609.34,
    'Feet': 0.3048,
    'Inches': 0.0254,
    'Yards': 0.9144,

    'Kilograms': 1.0,
    'Grams': 0.001,
    'Milligrams': 0.000001,
    'Micrograms': 0.000000001,
    'Tons': 1000.0,
    'Pounds': 0.453592,
    'Ounces': 0.0283495,

    'Bytes': 1.0,
    'Kilobytes': 1024.0,
    'Megabytes': 1048576.0,
    'Gigabytes': 1073741824.0,
    'Terabytes': 1099511627776.0,
    'Petabytes': 1125899906842624.0,

    'Hertz': 1.0,
    'Kilohertz': 1000.0,
    'Megahertz': 1000000.0,
    'Gigahertz': 1000000000.0,

    'Square Meters': 1.0,
    'Square Kilometers': 1000000.0,
    'Square Feet': 0.092903,
    'Square Miles': 2589988.11,
    'Acres': 4046.86,
    'Hectares': 10000.0,

    'Liters': 1.0,
    'Milliliters': 0.001,
    'Cubic Meters': 1000.0,
    'Cubic Feet': 28.3168,
    'Gallons': 3.78541,
    'Quarts': 0.946353,

    'Seconds': 1.0,
    'Minutes': 60.0,
    'Hours': 3600.0,
    'Days': 86400.0,
    'Weeks': 604800.0,
    'Months': 2592000.0,
    'Years': 31536000.0,
  };

  static double convert(String fromUnit, String toUnit, double inputValue, String category) {
    if (category == 'Temperature') {
      return _convertTemperature(fromUnit, toUnit, inputValue);
    }

    double fromFactor = baseConversionFactors[fromUnit]!;
    double toFactor = baseConversionFactors[toUnit]!;

    double valueInBase = inputValue * fromFactor;
    return valueInBase / toFactor;
  }

  static double _convertTemperature(String fromUnit, String toUnit, double inputValue) {
    double celsius;

    switch (fromUnit) {
      case 'Celsius':
        celsius = inputValue;
        break;
      case 'Fahrenheit':
        celsius = (inputValue - 32) * 5/9;
        break;
      case 'Kelvin':
        celsius = inputValue - 273.15;
        break;
      default:
        celsius = inputValue;
    }


    switch (toUnit) {
      case 'Celsius':
        return celsius;
      case 'Fahrenheit':
        return (celsius * 9/5) + 32;
      case 'Kelvin':
        return celsius + 273.15;
      default:
        return celsius;
    }
  }

  static List<String> getUnitsForCategory(String category) {
    return categoryUnits[category] ?? ['Unit 1', 'Unit 2'];
  }
}